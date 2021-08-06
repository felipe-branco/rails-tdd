require "rails_helper"

describe CityWeather, type: :model do

  let(:model) { described_class }

  describe "#save_mapped_payload" do
    let(:mapped_payload) {
      {
        name: "London",
        weather: "Clear",
        description: "clear sky",
        temperature: 287.47,
        payload: {}
      }
    }
    before do
      model.save_mapped_payload(mapped_payload)
    end
    it "Save a CityWeather from mapped payload" do
      expect(CityWeather.find_by_city_name("London")).to be_present
    end
  end


end
