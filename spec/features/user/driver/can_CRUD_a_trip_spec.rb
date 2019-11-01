require 'rails_helper'

RSpec.describe "A driver can CRUD trips" do
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

      @rtd1 = RtdLocation.create!(area: "Denver,CO", name: "RTD Park-N-Ride I-25 & Broadway Station", address: "901 S Broadway, Denver, CO 80223, USA", latitude: nil, longitude: nil, place_id: nil)
      @rtd2 = RtdLocation.create!(area: "Denver,CO", name: "Colorado Station RTD Park and Ride Lot", address: "4401 E Evans Ave, Denver, CO 80222, USA", latitude: nil, longitude: nil, place_id: nil)

      @current_user.vehicles.create!(make: "Toyota", model: "Highlander", year: "2010", awd: true, storage_rack: false, total_seats: 5, image: "")

    end

    it "As a logged in user, when I visit '/trip_dashboard' and I click on
     'I Need Cheeks In My Seats (Give A Ride)', I should be taken to
      '/dashboard/drivers/new' I should see a form to fill in information
      to create a new trip. The following fields will be required to
      successfully create a new trip:
      - Ride Offer (drop down menu to one-way or round-trip)
      - Seats Available (drop down menu)
      - option to use previous vehicles (current_user.vehicles) dropdown menu
      - Gear Storage Type (drop down menu)
      - AWD or 4x4 (checkbox)
      - Date
      - Where I Am Going
      - Send It! (button)
       The newly created trip should appear on the rides index page." do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

      visit ('/trip_dashboard')
      click_on "I Need Cheeks In My Seats"

      expect(current_path).to eq('/trip_dashboard/drivers/new')
      expect(page).to have_css('.trip_creation_form')
      expect(page).to have_content("Trip Details")
      expect(page).to have_content("Seats Available")
      expect(page).to have_content("Date of Departure")
      expect(page).to have_content("Destination")
      expect(page).to have_button("SEND IT")

      select "One Way", from: :ride_type
      select "2", from: :seats_available
      select "Keystone", from: :destination_point
      select "Toyota Highlander", from: :vehicle_id
      select "RTD Park-N-Ride I-25 & Broadway Station", from: :rtd_location_id
      select "01", from: :day_of_trip
      select "Nov", from: :month_of_trip
      select "2019", from: :year_of_trip
      click_on "SEND IT"

      trip = Trip.last

      expect(current_path).to eq(trip_show_path(trip.id))
      expect(page).to have_content("Ready To Shred")
      expect(page).to have_content(trip.date_of_departure)
      expect(page).to have_content(trip.ride_type)
      expect(page).to have_content(trip.destination_point)
      expect(page).to have_content("Toyota Highlander")
      expect(page).to have_content(trip.rtd_location.name)
      expect(page).to have_link("Change Up (Edit This Trip)")
      expect(page).to have_link("Flake (Cancel This Trip)")

      click_link "Change Up (Edit This Trip)"
      expect(current_path).to eq(trip_edit_path(trip.id))

      select "4", from: :seats_available
      click_on "SEND IT"

      # expect(trip.seats_available).to eq(4)
    end
  end
end
