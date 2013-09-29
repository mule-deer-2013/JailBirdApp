class ApiController < ActionController::Base

  CLIENT = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

  def calls
    render 'calls.xml.builder'
  end

  def ivr
      contacts = Contact.all
      groups = Group.all
      
    r = Twilio::TwiML::Response.new do |r|

      if params['Digits'] == "1"
        r.Gather :numDigits => '2', :action => '/api/dial', :method => 'get' do |g|
          contacts.each do |contact|
            g.Say "To call #{contact.name}, press #{contact.id}"
            # $fuck_ruby = contact
          end
        end

      elsif params['Digits'] == "2"
        r.Gather :numDigits => '2', :action => '/api/sms_blast', :method => 'get' do |g|
          groups.each do |group|
            g.Say "To SMS blast #{group.name}, press #{group.id}"
          end
        end

      elsif params['Digits'] == "3"
        r.Gather :numDigits => '3', :action => '/api/voice_blast', :method => 'get' do |g|
          groups.each do |group|
            g.Say "To Voice blast #{group.name}, press #{group.id}"
          end
        end
      end
    end
    
    render :xml => r.text

  end

  def dial_contact
    r = Twilio::TwiML::Response.new do |r|
      r.Dial Contact.find(params['Digits']).phone_number
      r.Say 'The call failed or the remote party hung up. Goodbye.'
    end

    render :xml => r.text
  end

  def transcribe_call
    group = Group.find(params[:group])
    group_sms(group, params[:TranscriptionText])
  end

  def sms_blast
    @group_id = params["Digits"]
    render "vm_to_text.xml.builder"
  end

  def group_sms(group, text)
    friends = {}
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
    @group_id = params["Digits"]
    render "voice_blast.xml.builder"
  end

  def voice_broadcasting
    group = Group.find(1)
    recording_url = params[:RecordingUrl]
    group_voice(group, recording_url)
  end

  def group_voice(group, recording)
    friends = {}
    group.contacts.each do |contact|
      friends[contact.name] = contact.phone_number
    end

    friends.each do |name,num|
      CLIENT.account.calls.create(
        :from => "+14807252473",
        :to => num,
        :url => "http://157a088b.ngrok.com/api/sending_voice_message/?recording=#{recording}"
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
