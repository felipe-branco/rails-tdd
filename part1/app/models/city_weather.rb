class CityWeather < ApplicationRecord

  def self.save_mapped_payload(mapped_payload)
    city_weather = CityWeather.new
    city_weather.city_name = mapped_payload[:name]
    city_weather.weather = mapped_payload[:weather]
    city_weather.description = mapped_payload[:description]
    city_weather.temperature = mapped_payload[:temperature]
    city_weather.payload = mapped_payload[:payload]
    city_weather.save
  end

end
