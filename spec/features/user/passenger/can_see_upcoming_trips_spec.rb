require 'rails_helper'

RSpec.describe "Trips Available To Join" do
  describe "passenger trips" do
    before :each do

      @user = User.create!(user_name: "jerry_of_the_day",
                                  first_name: "Jerry",
                                  last_name: "Jones",
                                  password: "tester",
                                  pass: "Epic",
                                  bio: "Just got to send it bro!",
                                  sport_type: "ski",
                                  email: "jerry@email.com")

      @user2 = User.create!(user_name: "jerry_of_yesterday",
                                  first_name: "Jerry",
                                  last_name: "Bones",
                                  password: "tester",
                                  pass: "Epic",
                                  bio: "Just got sent bro!",
                                  sport_type: "ski",
                                  email: "jerry2@email.com")

      @rtd1 = RtdLocation.create!(area: "Denver,CO", name: "RTD Park-N-Ride I-25 & Broadway Station", address: "901 S Broadway, Denver, CO 80223, USA", latitude: nil, longitude: nil, place_id: nil)
      @rtd2 = RtdLocation.create!(area: "Denver,CO", name: "Colorado Station RTD Park and Ride Lot", address: "4401 E Evans Ave, Denver, CO 80222, USA", latitude: nil, longitude: nil, place_id: nil)

      @vehicle1 = @user.vehicles.create!(make: "Toyota", model: "Highlander", year: "2010", awd: true, storage_rack: false, total_seats: 5, image: "")
      @trip1 = @user.trips.create(vehicle_id: @vehicle1.id, rtd_location_id: @rtd1.id, seats_available: 2, destination_point: "Keystone", ride_type: "One Way", date_of_departure: "Nov 01 2019")
      @trip2 = @user.trips.create(vehicle_id: @vehicle1.id, rtd_location_id: @rtd2.id, seats_available: 3, destination_point: "Keystone", ride_type: "One Way", date_of_departure: "Nov 08 2019")

    end

    it "can see the trip index and all the things related to that" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
      visit ('/trip_dashboard')
      click_on "Looking To Put My Junk In Your Trunk"
      expect(current_path).to eq('/trip_dashboard/passneger/index')

      expect(page).to have_css("#trip-#{@trip1.id}")
      expect(page).to have_css("#trip-#{@trip2.id}")

      within "#trip-#{@trip1.id}" do
        expect(page).to have_content(@trip1.rtd_location.name)
        expect(page).to have_content(@trip1.destination_point)
        expect(page).to have_content(@trip1.seats_available)
        expect(page).to have_content(@trip1.ride_type)
        expect(page).to have_content(@trip1.date_of_departure)
        expect(page).to have_link("Catch This Lift")
      end

      within "#trip-#{@trip2.id}" do
        expect(page).to have_content(@trip2.rtd_location.name)
        expect(page).to have_content(@trip2.destination_point)
        expect(page).to have_content(@trip2.seats_available)
        expect(page).to have_content(@trip2.ride_type)
        expect(page).to have_content(@trip2.date_of_departure)
        expect(page).to have_link("Catch This Lift")

        click_on "Catch This Lift"
      end

      ride = Ride.last

        expect(current_path).to eq("/my_rides")
        expect(page).to have_content("My Rides")
        expect(page).to have_css("#ride-#{ride.id}")

        within "#ride-#{ride.id}" do
          expect(page).to have_content(@trip2.ride_type)
          expect(page).to have_content(@trip2.date_of_departure)
          expect(page).to have_content(@trip2.rtd_location.name)
          expect(page).to have_content(@trip2.destination_point)
        end
        
    end
  end
end
