# As a user, when I visit '/dashboard',
# I should see two buttons
#
#  Button 1: I Need Cheeks In My Seats (Give A Ride)
#  Button 2: Looking To Put My Junk In Your Trunk (Need A Ride)

require 'rails_helper'

RSpec.describe "Trip Buttons" do

  describe "Registered User Trip Dashboard" do
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

    it "As a user, when I visit '/trip_dashboard', I see two buttons.
      Button 1: 'GIVE A RIDE (I Need Cheeks In My Seats)'
      Button 2: 'NEED A RIDE (Looking To Put My Junk In Your Trunk)'" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
      visit ('/trip_dashboard')

      expect(page).to have_link("Give A Ride")
      expect(page).to have_link("Need A Ride")
      expect(page).to have_content("I Need Cheeks In My Seats")
      expect(page).to have_content("Looking To Put My Junk In Your Trunk")
    end

    # it "As a user, when I am on '/trips_dashboard' and I click on
    # (Looking to put junk in your trunk), I am taken to '/trips_filter'.
    # On this page, I see a form that i can fill out with the following fields:
    # rec type, trip type, pass type, desired dates" do
    #
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
    # visit "/trip_dashboard"
    #
    # expect(current_path).to eq("/trip_filter")
    # expect(page).to have_css('.trip_filter_form')
    # expect(page).to have_content("Need A Ride")
    # expect(page).to have_content("Recreation Type")
    # expect(page).to have_content("Trip Type")
    # expect(page).to have_content("Pass Type")
    # expect(page).to have_content("Desired Dates")
    # end
  end
end
