require 'rails_helper'

RSpec.describe RtdLocation, type: :model do
  describe "Validations" do
   it {should validate_presence_of :area}
   it {should validate_presence_of :name}
   it {should validate_presence_of :address}
  end
end
