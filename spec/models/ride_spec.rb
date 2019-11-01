require 'rails_helper'

RSpec.describe Ride, type: :model do

  describe 'relationships' do
    it { should belong_to :user}
    it { should belong_to :trip}
  end

end
