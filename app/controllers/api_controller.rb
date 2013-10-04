class ApiController < ActionController::Base

  CLIENT = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

  def calls
    render 'welcome.xml.builder'
  end

  def phone_validation
    phone = Phonelib.parse(params["Digits"]).sanitized
    if User.find_by_phone_number(phone)
      @phone = phone
      render 'pin_validation.xml.builder'
    else
      render 'retry_phone_validation.xml.builder'
    end
  end

  def jailbird_pin
    user = User.where(phone_number: params[:phone], jailbird_pin: params["Digits"])
    if user.count == 1
      @user_id = user.first.id
      render 'ivr.xml.builder'
    else
      @phone = params[:phone]
      render 'retry_pin_validation.xml.builder'
    end
  end

  def ivr
    user = User.find(params[:user])
    contacts = user.contacts
    groups = user.groups
    favorites = groups.find_by_name("Favorites").contacts.order

    response = Twilio::TwiML::Response.new do |r|
      if params['Digits'] == "1"
        r.Gather :numDigits => "2", :action => "/api/dial/?user=#{user.id}", :method => "get" do |g|
          favorites.each_with_index do |contact, index|
            g.Say "To call #{contact.name}, press #{index+1}."
          end
        end
      elsif params['Digits'] == "2"
        r.Gather :numDigits => "2", :action => "/api/sms_blast/?user=#{user.id}", :method => 'get' do |g|
          groups.each do |group, index|
            g.Say "To SMS blast #{group.name}, press #{index+1}"
          end
        end
      elsif params['Digits'] == "3"
        r.Gather :numDigits => '3', :action => "/api/voice_blast/?user=#{user.id}", :method => 'get' do |g|
          groups.each do |group, index|
            g.Say "To Voice blast #{group.name}, press #{index+1}"
          end
        end
      end
    end

    render :xml => response.text
  end

  def dial_contact
    user = User.find(params[:user])
    groups = user.groups
    favorites = groups.find_by_name("Favorites").contacts.order

    response = Twilio::TwiML::Response.new do |r|
      r.Dial favorites[(params['Digits'].to_i - 1)].phone_number
      r.Say 'The call failed or the remote party hung up. Goodbye.'
    end

    render :xml => response.text
  end

  def transcribe_call
    group = Group.find(params[:group])
    group_sms(group, params[:TranscriptionText])
  end

  def sms_blast
    user = User.find(params[:user])
    @group_id = user.groups[(params['Digits'].to_i - 1)].id
    render "vm_to_text.xml.builder"
  end

  def group_sms(group, text)
    friends = {}
    group = Group.find(group)
    group.contacts.each do |contact|
      friends[contact.name] = contact.phone_number
    end

    friends.each do |name,num|
      CLIENT.account.sms.messages.create(
        :from => "+14807252473",
        :to => num,
        :body => text
        )
    end
  end

  def voice_blast
    user = User.find(params[:user])
    @group_id = user.groups[(params['Digits'].to_i - 1)].id
    render "voice_blast.xml.builder"
  end

  def voice_broadcasting
    group = params[:group]
    recording_url = params[:RecordingUrl]
    group_voice(group, recording_url)
  end

  def group_voice(group, recording)
    friends = {}
    group = Group.find(group)
    group.contacts.each do |contact|
      friends[contact.name] = contact.phone_number
    end
    friends.each do |name, num|
      CLIENT.account.calls.create(
        :from => "+14807252473",
        :to => num,
        :url => "http://jailbirdapp.com/api/sending_voice_message/?recording=#{recording}"
        )
    end
  end

  def sending_voice_message
    response = Twilio::TwiML::Response.new do |r|
      r.Play params[:recording]
    end
    render :xml => response.text
  end
end
