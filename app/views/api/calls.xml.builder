xml.instruct!
xml.Response do

  xml.Say(:voice => "alice", :language => "en-AU") do
    xml.text! "Thanks for calling jailbird"
  end

  xml.Gather(:numDigits => "1", :action => "/api/ivr", :method => "get") do 
    xml.Say(:voice => "alice", :language => "en-AU") do
      xml.text! "To navigate your address book, press 1."
    end
    xml.Say(:voice => "alice", :language => "en-AU") do
      xml.text! "To text your groups, press 2."
    end
    xml.Say(:voice => "alice", :language => "en-AU") do
      xml.text! "Press any other key to start over."
    end
    xml.Say(:voice => "alice", :language => "en-AU") do
      xml.text! "Press 8 to wolf everyone."
    end
  end
end
