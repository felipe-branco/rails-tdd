require "rails_helper"

describe CityCurrentWeatherController, type: :controller do

  describe "#create" do
    it "Asks the weather in the passed city by name" do
      post :create, params: { city_name: "Sao Paulo, BR" }

      expect(response).to have_http_status(204)
      expect(CityWeather.where(city_name: "São Paulo").count).to eq(1)
    end
  end

end
