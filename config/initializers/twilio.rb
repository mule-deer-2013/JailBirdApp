unless Rails.env.production?
  twilio_config = YAML.load_file(APP_ROOT.join('../config/auth', 'twilio.yaml'))

  twilio_config.each do |key, value|
    ENV[key] = value
  end
end

@client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
