require 'rails_helper'

describe "user review creation" do
  before :each do
    #you need to take a trip here
    #trip needs 2 other people in it + 1 not on the trip
    #trip ends - driver clicks on "end trip or whatever we decide"
    @user = User.create!(user_name: "jerry",
              first_name: "Jerry",
              last_name: "Jones",
              pass: "Epic",
              bio: "Send it!",
              sport_type: "ski",
              email: "jerry@email.com",
              password: "password",
              password_confirmation: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'when a driver finishes a trip I was on' do
    it "I can see a button to review each of my fellow lift buddies after a trip" do
      expect(current_path).to eq(trip_lift_buddies_path)
      expect(page).to have_content("Rate Your Lift Buddies!")
      expect(page).to have_css(".lift_buddies")

      within ".lift_buddies" do
        expect(page).to have_content(@buddy_1.username)
        expect(page).to have_content(@buddy_2.username)
        expect(page).to_not have_content(@buddy_3.username)
      end

      within "#lift-buddy-#{@buddy_1.id}" do
        expect(page).to have_button("Review Me!")
      end

      within "#lift-buddy-#{@buddy_.id}" do
        expect(page).to have_button("Review Me!")
      end
    end

    it "I can click on that button to create a new review" do
      title = "Full send brah"
      content = "This trip was rad. Great music."
      rating = 5

      within "#lift-buddy-#{@buddy_1.id}" do
        click_button("Review Me!")

        expect(current_path).to eq(new_user_review_path(@buddy_1))

        fill_in "Title", with: title
        fill_in "Content", with: content
        fill_in "Rating", with: rating

        click_button "Send It!"

        last_review = Review.last

        expect(current_path).to eq(profile_path(@buddy_1))
        expect(last_review.title).to eq(title)
        expect(last_review.content).to eq(content)
        expect(last_review.rating).to eq(rating)

        within "#review-#{last_review.id}" do
          expect(page).to have_content(title)
          expect(page).to have_content(content)
          expect(page).to have_content("User Rating: #{rating}/5")
        end
      end
    end

    it "I cannot create a review unless the whole form is completed" do
      title = "Boo"
      content = ""
      rating = 1

      within "#lift-buddy-#{@buddy_1.id}" do
        click_button("Review Me!")
        fill_in "Title", with: title
        fill_in "Content", with: content
        fill_in "Rating", with: rating

        click_button "Send It!"

        expect(page).to have_content("Please fill in all fields in order to create a review.")
        expect(current_path).to eq(new_user_review_path(@buddy_1))
      end
    end

    it "I get an error if my rating is not between 1 and 5" do
      title = "Full send brah"
      content = "This trip was rad. Great music."
      rating = 10

      within "#lift-buddy-#{@buddy_1.id}" do
        fill_in "Title", with: title
        fill_in "Content", with: content
        fill_in "Rating", with: rating

        click_button "Send It!"
        expect(page).to have_content("Rating must be between 1 and 5")
        expect(page).to have_content("Review Me!")
      end 
    end
  end
end
