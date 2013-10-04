xml.instruct!
xml.Response do
  xml.Say(:voice => "alice") do
    xml.text! "Leave a message to play to your group"
  end
  xml.Record(:action => "/api/voice_broadcasting/?group=#{@group_id}")
end
