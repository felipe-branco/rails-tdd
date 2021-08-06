CONFIG = YAML.load_file(Rails.root.join("config/app.yml"))[Rails.env]

module APP_CONFIG
  module WEATHER_API
    API_KEY = CONFIG['weather_api']['api_key']
  end
end
