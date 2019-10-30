require 'rails_helper'

describe RtdLocationsService do
  subject = RtdLocationsService.new
  context "instance methods" do
    it "returns all rtd locations in Denver Metro Area" do

      park_n_rides = subject.rtd_locations
      parsed_data = JSON.parse(park_n_rides.body, symbolize_names: true)
      expect(parsed_data).to be_a Hash
      expect(parsed_data[:"Denver,CO"]).to be_an Array
      expect(parsed_data[:"Denver,CO"].count).to eq(11)
    end
  end
end
