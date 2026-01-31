require 'rails_helper'

RSpec.describe WeatherApiConnector do
  describe '#weather_data' do
    let(:fake_response) do
      {
        "location" => { "name" => "Warsaw" },
        "current" => { "temp_c" => 21 }
      }.to_json
    end

    it 'calls the weather API and returns parsed JSON' do
      uri = URI("http://api.weatherapi.com/v1/current.json?key=#{A9n.weather_api_key}&q=Warsaw")

      expect(Net::HTTP).to receive(:get).with(uri).and_return(fake_response)

      result = described_class.new.weather_data

      expect(result["location"]["name"]).to eq("Warsaw")
      expect(result["current"]["temp_c"]).to eq(21)
    end
  end
end