require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe "Validations" do
    it {should validate_presence_of(:awd)}
		it {should validate_presence_of(:storage_rack)}
    it {should validate_presence_of(:total_number_seats)}
  end

  describe "Relationships" do
    it {should belong_to :user}
  end
end
