xml.instruct!
xml.Response do
  xml.Gather(:numDigits => "5", :action => "/api/jailbird_pin/?phone=#{@phone}", :method => "get") do
    xml.Say(:voice => "alice", :language => "en-AU") do
      xml.text! "Now enter your pin number followed by the pound key."
    end
  end
end