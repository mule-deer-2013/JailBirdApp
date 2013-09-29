xml.instruct!

xml.Response do
  xml.Gather(:action => "/api/ivr", :numDigits => "1") do
    xml.Say(:voice => "alice") do
      xml.text! "Hey alex, please press 1 to tell your family your locked up.
                Press 2 to ask your friends to bail you out."
    end
  end
end
