class CurrentWeatherMapper

  def map_weather_api_response(response)
    {
      name: response.dig("name"),
      weather: response.dig("weather").first.dig("main"),
      description: response.dig("weather").first.dig("description"),
      temperature: response.dig("main","temp"),
      payload: response
    }
  end

end
