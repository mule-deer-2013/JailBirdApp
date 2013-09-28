xml.instruct!
xml.Response do
  xml.Say(:voice => "alice") do
    xml.text! "Hey alex, please leave a message to text your friends."
  end
  xml.Record(:transcribe => true, :transcribeCallback => "/api/transcribe_call")
end