require 'rails_helper'

describe "user reviews" do
  before :each do
    @user = User.create!(user_name: "jerry",
              first_name: "Jerry",
              last_name: "Jones",
              pass: "Epic",
              bio: "Send it!",
              sport_type: "ski",
              email: "jerry@email.com",
              password: "password",
              password_confirmation: "password")

    @user_2 = User.create!(user_name: "jerralina",
              first_name: "Jerralina",
              last_name: "Jeffries",
              pass: "Epic",
              bio: "I sent it",
              sport_type: "ski",
              email: "jerralina@email.com",
              password: "password",
              password_confirmation: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "users have a list of reviews" do
    visit ("/users/#{@user.id}")

    expect(page).to_not have_content("Average User Rating: #{@user.avg_rtg}/5")
    expect(page).to have_content("This user doesn't have any reviews yet")

    review_1 = @user.reviews.create!(title: "Full send brah", content: "Jerry's rad.", rating: 5)
    review_2 = @user.reviews.create!(title: "Crazy driver", content: "Jerry goes full send on the roads. Scary.", rating: 2)

    visit ("/users/#{@user.id}")

    expect(page).to have_content("User Reviews")
    expect(page).to have_css(".reviews")

    within ".reviews" do
      expect(page).to have_content(review_1.title)
      expect(page).to have_content(review_1.content)
      expect(page).to have_content("User Rating: #{review_1.rating}/5")

      expect(page).to have_content(review_2.title)
      expect(page).to have_content(review_2.content)
      expect(page).to have_content("User Rating: #{review_2.rating}/5")
    end

    expect(@user.avg_rtg).to eq(3.5)
    expect(page).to have_content("Average User Rating: #{@user.avg_rtg}/5")
  end

  it "users can update reviews they've given to other riders" do
    # @user rides with @user_2 on a trip
    visit ("/users/#{@user_2.id}")
      click_link("Review Me!")

      fill_in "Title", with: "I don't like titles"
      fill_in "Content", with: "Jerralina was cool."
      select(4, from: "Rating").select_option



      click_button "Send It!"

      @last_review = Review.last

    visit "/users/#{@user_2.id}"

    click_on "Edit Review"

    expect(current_path).to eq(edit_user_review_path(@user_2))
    expect(page).to have_content("I don't like titles")
    expect(page).to have_content("Jerralina was cool.")
    expect(page).to have_content("User Rating: 4/5")

    fill_in "Title", with: "Good lift buddy"
    click_button "Send It!"

    expect(current_path).to eq(profile_path(@user_2))

    within "#review-#{@last_review.id}" do
      expect(page).to_not have_content("I don't like titles")
      expect(page).to have_content("Good lift buddy")
    end
  end

#   # it "users can delete reviews they've given to other riders" do
  #   # @user rides with @user_2 on a trip
  #   # maybe create another review made by a user_3 to account for edge case?
  #   within "#lift-buddy-#{@user_2.id}" do
  #     click_button("Review Me!")
  #
  #     fill_in "Title", with: "Good lift buddy"
  #     fill_in "Content", with: "Jerralina was cool."
  #     fill_in "Rating", with: 4
  #
  #     click_button "Send It!"
  #
  #     @last_review = Review.last
  #   end
  #
  #   visit profile_path(@user_2)
  #
  #   within "#review-#{@last_review.id}" do
  #     click_button "Delete"
  #   end
  #
  #   expect(page).to have_content("Your review has been deleted!")
  #   expect(current_path).to eq(profile_path(@user_2))
  #   expect(page).to_not have_content("Good lift buddy")
  # end
end
