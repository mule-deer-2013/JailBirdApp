class ApiController < ActionController::Base

  CLIENT = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

  def calls
    
    contacts = Contact.all
    friends = {}

    contacts.each do |contact|
      friends[contact.phone_number] = contact.name
    end
    name = friends[params['From']] || 'Monkey'
    p "x" * 50
    p name
    r = Twilio::TwiML::Response.new do |r|
      r.Say "What did you do this time? #{name}"
      r.Gather :numDigits => '1', :action => '/api/ivr', :method => 'get' do |g|
        g.Say 'To navigate your address book, press 1.', language: 'en-gb'
        g.Say 'Press 2 to message your groups.'
        g.Say 'Press any other key to start over.' 
      end
    end     
    render :xml => r.text
  end

  def ivr

    
    r = Twilio::TwiML::Response.new do |r|
      r.Dial '+19096496998' ### Connect the caller to Koko, or your cell
      r.Say 'The call failed or the remote party hung up. Goodbye.'
    end
    render :xml => r.text
          
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


  def phonebook

  end

end
