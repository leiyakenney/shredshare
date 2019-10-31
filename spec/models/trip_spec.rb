require 'rails_helper'

RSpec.describe Trip, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:ride_type) }
    it { should validate_presence_of(:vehicle_id) }
    it { should validate_presence_of(:rtd_location_id) }
    it { should validate_presence_of(:destination_point) }
    it { should validate_presence_of(:seats_available) }
    it { should validate_presence_of(:date_of_departure) }
  end

  describe 'relationships' do
    it { should belong_to :user}
    it { should belong_to :vehicle}
    it { should belong_to :rtd_location}
  end

end
