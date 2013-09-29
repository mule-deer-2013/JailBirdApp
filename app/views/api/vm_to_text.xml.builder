xml.instruct!
xml.Response do
  xml.Say(:voice => "alice") do
    xml.text! "Leave a message to text to your group"
  end
  xml.Record(:transcribe => true, :transcribeCallback => "/api/transcribe_call/?group=#{@group_id}")
end
