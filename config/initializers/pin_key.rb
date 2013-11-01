unless Rails.env.production?
  pin_key_config = YAML.load_file(APP_ROOT.join('../config/auth', 'pin_key.yaml'))

  pin_key_config.each do |key, value|
    ENV[key] = value
  end
end