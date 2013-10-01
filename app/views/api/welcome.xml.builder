xml.instruct!
xml.Response do
  xml.Gather(:numDigits => "12", :action => "/api/phone_validation", :method => "get") do
  xml.Say(:voice => "alice", :language => "en-AU") do
    xml.text! "Thanks for calling Jailbird.
              Please enter your phone number followed by the pound key
              to access your personal phone book."
    end
  end
end
