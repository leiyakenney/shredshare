require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe "Validations" do
    it {should validate_presence_of(:make)}
    it {should validate_presence_of(:model)}
    it {should validate_presence_of(:year)}
    it {should validate_presence_of(:total_seats)}
  end

  describe "Relationships" do
    it {should belong_to :user}
  end
end
