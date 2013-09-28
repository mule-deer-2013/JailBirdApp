class ApiController < ActionController::Base

  CLIENT = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

  def calls

    contacts = Contact.all
    friends = {}

    contacts.each do |contact|
      friends[contact.phone_number] = contact.name
    end

    name = friends[params['From']] || 'Monkey'
    r = Twilio::TwiML::Response.new do |r|
      r.Say "What did you do this time?", voice: 'Alice'
      r.Gather :numDigits => '1', :action => '/api/ivr', :method => 'get' do |g|
        g.Say 'To navigate your address book, press 1.', voice: 'Alice'
        g.Say 'Press 2 to message your groups.', voice: 'Alice'
        g.Say 'Press any other key to start over.', voice: 'Alice'
      end
    end
    render :xml => r.text
  end


  def ivr

    friends = contact_list

    r = Twilio::TwiML::Response.new do |r|
      redirect_to '/api/calls' unless params['Digits'] == "1" || params['Digits'] == "2"
      if params['Digits'] == "1"

        r.Gather :numDigits => '1', :action => '/api/ivr', :method => 'get' do |g|
          g.Say 'To navigate your address book, press 1.', voice: 'Alice'

          friends.each_pair do |num, person|
            r.Say "To call #{person}, press "
          end
        end
      end
    end
    # render :xml => r.text
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

