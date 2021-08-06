require "rails_helper"

describe CurrentWeatherMapper do

  let(:mapper) { described_class.new }

  describe "#map_weather_api_response" do
    let(:response) {
      {"coord"=>{"lon"=>-0.1257, "lat"=>51.5085}, "weather"=>[{"id"=>800, "main"=>"Clear", "description"=>"clear sky", "icon"=>"01n"}], "base"=>"stations", "main"=>{"temp"=>287.47, "feels_like"=>287.18, "temp_min"=>286.24, "temp_max"=>288.73, "pressure"=>1001, "humidity"=>85}, "visibility"=>10000, "wind"=>{"speed"=>4.63, "deg"=>240}, "clouds"=>{"all"=>2}, "dt"=>1628289079, "sys"=>{"type"=>2, "id"=>2019646, "country"=>"GB", "sunrise"=>1628224321, "sunset"=>1628278845}, "timezone"=>3600, "id"=>2643743, "name"=>"London", "cod"=>200}
    }
    let(:result_hash) {
      {
        name: "London",
        weather: "Clear",
        description: "clear sky",
        temperature: 287.47,
        payload: response
      }
    }
    it "Map response to a known hash" do
      expect(mapper.map_weather_api_response(response)).to eq(result_hash)
    end
  end

end
