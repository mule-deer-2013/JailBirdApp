xml.instruct!
xml.Response do
  xml.Gather(:numDigits => "12", :action => "/api/phone_validation", :method => "get") do
  xml.Say(:voice => "alice", :language => "en-AU") do
    xml.text! "I'm sorry we can't find you do not exist, please try entering in your
              phone number again."
    end
  end
end