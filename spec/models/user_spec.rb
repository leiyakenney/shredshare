require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it {should validate_presence_of(:user_name)}
    it {should validate_uniqueness_of(:user_name)}
		it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
  end

  describe "Relationships" do
    it {should have_many :vehicles}
  end
end
