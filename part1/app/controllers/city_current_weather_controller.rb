require 'net/http'

class CityCurrentWeatherController < ApplicationController

  BASE_URL = "http://api.openweathermap.org/data/2.5/weather?q={{city_name}}&appid=#{APP_CONFIG::WEATHER_API::API_KEY}"

  def create
    response = make_weather_api_request

    mapper = CurrentWeatherMapper.new
    mapped_payload = mapper.map_weather_api_response(response)

    CityWeather.save_mapped_payload(mapped_payload)
  end

  private

  def make_weather_api_request
    url = URI.parse(replace_city_name_param)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    JSON.parse(res.body).to_hash
  end

  def replace_city_name_param
    BASE_URL.gsub("{{city_name}}", weather_params[:city_name])
  end

  def weather_params
    params.permit(:city_name)
  end

end
