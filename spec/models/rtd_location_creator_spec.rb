require 'rails_helper'

RSpec.describe RtdLocationCreator, type: :model do
  it "creates a rtd_location record" do
    # WebMock.allow_net_connect!
    rtd_locations_data = File.read('./fixtures/rtd_locations.json')

    creator = RtdLocationCreator.new
    rtd_location_objects = creator.create_record(rtd_locations_data)
    first_location = rtd_location_objects.first[0]
    expect(first_location[:area]).to eq("Denver,CO")
    expect(first_location[:name]).to eq("RTD Park-N-Ride I-25 & Broadway Station",)
    expect(first_location[:address]).to eq("901 S Broadway, Denver, CO 80223, USA")
  end
end
