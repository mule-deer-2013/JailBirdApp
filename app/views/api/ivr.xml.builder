xml.instruct!
xml.Response do
  xml.Gather(:numDigits => "1", :action => "/api/ivr/?user=#{@user_id}", :method => "get") do
    xml.Say(:voice => "alice", :language => "en-AU") do
      xml.text! "To call a contact in your favorites group, press 1."
    end
    xml.Say(:voice => "alice", :language => "en-AU") do
      xml.text! "To text a group, press 2."
    end
    xml.Say(:voice => "alice", :language => "en-AU") do
      xml.text! "To voice blast a group, press 3."
    end
  end
end
