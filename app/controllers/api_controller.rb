class ApiController < ActionController::Base

  CLIENT = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

  def calls
    render "calls.xml.builder"
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

