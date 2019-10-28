require 'rails_helper'

RSpec.describe "A driver can create a trip" do
  describe "Putting cheeks in your seats" do
    before :each do
      @current_user = User.create!(user_name: "jerry_of_the_day",
                                  first_name: "Jerry",
                                  last_name: "Jones",
                                  password: "tester",
                                  pass: "Epic",
                                  bio: "Just got to send it bro!",
                                  sport_type: "ski",
                                  email: "jerry@email.com")
    end

    it "As a logged in user, when I visit '/trip_dashboard' and I click on
     'I Need Cheeks In My Seats (Give A Ride)', I should be taken to
      '/dashboard/drivers/new' I should see a form to fill in information
      to create a new trip. The following fields will be required to
      successfully create a new trip:
      - Ride Offer (drop down menu to one-way or round-trip)
      - Seats Available (drop down menu)
      - Gear Storage Type (drop down menu)
      - AWD or 4x4 (checkbox)
      - Date
      - Where I Am Going
      - Send It! (button)
       The newly created trip should appear on the rides index page." do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
      
    end
  end
end
