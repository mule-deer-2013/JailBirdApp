xml.instruct!
xml.Response do
  xml.Gather(:numDigits => "5", :action => "/api/jailbird_pin/?phone=#{@phone}", :method => "get") do
    xml.Say(:voice => "alice", :language => "en-AU") do
      xml.text! "I'm sorry you've entered the incorrect pin. Please try again."
    end
  end
end