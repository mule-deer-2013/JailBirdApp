class ApiController < ActionController::Base
    
  CLIENT = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

  def calls
   
    contacts = Contact.all
    friends = {}

    contacts.each do |contact|
      friends[contact.name] = contact.phone_number
    end
    
    friends.each do |k,v|
      CLIENT.account.sms.messages.create(
        :from => "+14807252473",
        :to => v,
        :body => "Good morning #{k}, Thanks for the banananas yesterday. What a great party!"
      )   
    end
  end


  def group_sms
    
  end


  def phonebook
    
  end



end

