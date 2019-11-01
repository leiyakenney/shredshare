require 'rails_helper'

describe "user review creation" do
  before :each do
    @driver_1 = User.create!(user_name: "driver",
              first_name: "Jerralina",
              last_name: "Jeffries",
              pass: "Epic",
              bio: "I sent it",
              sport_type: "ski",
              email: "jerralina@email.com",
              password: "password",
              password_confirmation: "password")

    @vehicle_1 = @driver_1.vehicles.create!(make: "Toyota", model: "Tacoma", year: "2014", total_seats: "4")
    @rtd_location = RtdLocation.create!(area: "Denver", name: "University of Denver", address: "123 Rtd St. Denver CO, 80210")
    @trip_1 = Trip.create!(user_id: @driver_1.id, seats_available: 2, vehicle_id: @vehicle_1.id, rtd_location_id: @rtd_location.id, destination_point: "Keystone", date_of_departure: "Nov 30 2019", ride_type: "one-way")

    @user_1 = User.create!(user_name: "passenger",
      first_name: "Jerry",
      last_name: "Jones",
      pass: "Epic",
      bio: "Send it!",
      sport_type: "ski",
      email: "jerry@email.com",
      password: "password",
      password_confirmation: "password")

    @ride_1 = Ride.create!(trip_id: @trip_1.id, user_id: @user_1.id)

    @user_2 = User.create!(user_name: "rando",
      first_name: "Fred",
      last_name: "Turing",
      email: "rando@email.com",
      password: "password",
      password_confirmation: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
  end

  describe 'when I take a trip with someone' do
    it "I can see a link to review my fellow lift buddies on their profiles" do
      #
      visit ("users/#{@user_1.id}")
      expect(page).to have_link("Review Me!")
      # visit (profile_path(@user_2))
      # expect(page).to_not have_link("Review Me!")
    end

    it "I can click on that link to create a new review" do
      title = "Full send brah"
      content = "This trip was rad. Great music."
      rating = 5

      visit ("/users/#{@user_1.id}")
      click_link("Review Me!")

      expect(current_path).to eq(new_user_review_path(@user_1))

      fill_in "Title", with: title
      fill_in "Content", with: content
      select rating, from: "Rating"

      click_on "Send It!"

      last_review = Review.last

      expect(page).to have_content("You have successfully reviewed this lift buddy!")
      expect(current_path).to eq("/users/#{@user_1.id}")

      expect(last_review.title).to eq(title)
      expect(last_review.content).to eq(content)
      expect(last_review.rating).to eq(rating)
    end

    #
    # it "I cannot create a review unless the whole form is completed" do
    #   title = "Boo"
    #   content = ""
    #   rating = 1
    #
    #   visit ("/users/#{@user_1.id}")
    #   click_link("Review Me!")
    #   fill_in "Title", with: title
    #   fill_in "Content", with: content
    #   fill_in "Rating", with: rating
    #
    #   click_on "Send It!"
    #
    #   expect(page).to have_content("Please fill out this field")
    #   expect(current_path).to eq(new_user_review_path(@user_1))
    # end
  end
end
