class ApiController < ActionController::Base
    
  CLIENT = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']


  def calls
   
    friends = {}
    contacts = Contact.all

    contacts.each do |contact|
      friends[contact.name] = contact.phone_number
    end
    friends.each do |k,v|
      CLIENT.account.sms.messages.create(
        :from => "+14807252473",
        :to => v,
        :body => "Hey #{k}, Monkey party at 6PM. Bring Bananas!"
      )   
    end
    # render 'calls.xml.builder'
  end


  def group_sms
    
  end


  def phonebook
    
  end



end

