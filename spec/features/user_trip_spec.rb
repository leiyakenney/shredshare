# As a user, when I visit '/dashboard',
# I should see two buttons
#
#  Button 1: I Need Cheeks In My Seats (Give A Ride)
#  Button 2: Looking To Put My Junk In Your Trunk (Need A Ride)

require 'rails_helper'

RSpec.describe "User Trip Buttons" do

  describe "Registered User Trip Dashboard" do
    before :each do
      current_user = User.create!(user_name: "jerry_of_the_day",
                                  first_name: "Jerry",
                                  last_name: "Jones",
                                  password: "tester",
                                  pass: "Epic",
                                  bio: "Just got to send it bro!",
                                  sport_type: "ski",
                                  email: "jerry@email.com")
    end

    it "As a user, when I visit '/trip_dashboard', I see two buttons.
      Button 1: 'I Need Cheeks In My Seats (Give A Ride)'
      Button 2: 'Looking To Put My Junk In Your Trunk (Need A Ride)'" do
      visit ('/trip_dashboard')

      expect(page).to have_link("I Need Cheeks In My Seats")
      expect(page).to have_link("Looking To Put My Junk In Your Trunk")
      expect(page).to have_content("Give A Ride")
      expect(page).to have_content("Need A Ride")
    end
  end
end
