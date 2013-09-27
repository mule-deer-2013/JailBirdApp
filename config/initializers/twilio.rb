APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

twilio_config = YAML.load_file(APP_ROOT.join('../config/auth', 'twilio.yaml'))

twilio_config.each do |key, value|
  ENV[key] = value
end

@client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
