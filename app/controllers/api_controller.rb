class ApiController < ActionController::Base

  CLIENT = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

  def calls
    render 'calls.xml.builder'
  end


  def ivr

      contacts = Contact.all
      # groups = Group.all
      
      friends = {}
      contacts.each {|cont| friends[cont.phone_number] = cont.name}

    # r = Twilio::TwiML::Response.new do |r|

    #   if params['Digits'] == "1"
    #     r.Gather :numDigits => '1', :action => '/api/dial_contact', :method => 'get' do |g|

    #       friends.each_pair do |num, person|
    #         g.Say "To call #{person}, press 1"
    #       end

    #     end

    #   elsif params['Digits'] == "2"
    #     r.Gather :numDigits => '1', :action => '/api/group_sms', :method => 'get' do |g|
    #     end

    #   # else
    #   #   redirect_to '/api/calls' unless params['Digits'] == "1" || params['Digits'] == "2"
    #   end
    # end
    # render :xml => r.text
  r = Twilio::TwiML::Response.new do |r|
    r.Dial '+13105551212' ### Connect the caller to Koko, or your cell
    r.Say 'The call failed or the remote party hung up. Goodbye.'
  end

  render xml: r.text



  end

  def dial_contact
    
  end

  def group_sms(text)
    contacts = Contact.all
    friends = {}

    contacts.each do |contact|
      friends[contact.name] = contact.phone_number
    end

    friends.each do |k,v|
      CLIENT.account.sms.messages.create(
        :from => "+14807252473",
        :to => v,
        :body => "#{k}, #{text}"
        )
    end
  end


  def transcribe_call
    group_sms(params[:TranscriptionText])
  end

end

