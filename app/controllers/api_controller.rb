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
        r.Gather :numDigits => '2', :action => '/api/group_sms', :method => 'get' do |g|
          groups.each do |group|
            g.Say "To blast #{group.name}, press #{group.id}"
          end
        end
      end
    end
    
    p "x" * 50
    p r.text
    render :xml => r.text

  end



  def dial_contact

    r = Twilio::TwiML::Response.new do |r|
      r.Dial Contact.find(params['Digits']).phone_number
      r.Say 'The call failed or the remote party hung up. Goodbye.'
    end

    render :xml => r.text

  end



  def group_sms(text)

    group = Group.find(params['Digits'])
    friends = {}
    group.contacts.each do |contact|
      friends[contact.name] = contact.phone_number
    end

    friends.each do |name,num|
      CLIENT.account.sms.messages.create(
        :from => "+14807252473",
        :to => num,
        :body => "hi #{name}, help me."
        )
    end
  end


  def transcribe_call
    group_sms(params[:TranscriptionText])
  end

end

