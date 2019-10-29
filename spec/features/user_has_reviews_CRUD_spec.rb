require 'rails_helper'

describe "as a user" do
  before :each do
    @user_1 = User.create!(user_name: "jerry",
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
              last_name: "Jones",
              pass: "Epic",
              bio: "I sent it",
              sport_type: "ski",
              email: "jerralina@email.com",
              password: "password",
              password_confirmation: "password")
  end

  it "I can have a list of reviews" do
    review_1 = @user_1.reviews.create!(title: "Full send brah", content: "Jerry's rad.", rating: 5)
    review_2 = @user_1.reviews.create!(title: "Crazy driver", content: "Jerry goes full send on the roads. Scary.", rating: 2)

    visit profile_path(@user_1)

    within "review-#{review_1.id}" do
      expect(page).to have_content(review_1.title)
      expect(page).to have_content(review_1.content)
      expect(page).to have_content("User Rating: #{review_1.rating}/5")
    end

    within "review-#{review_2.id}" do
      expect(page).to have_content(review_2.title)
      expect(page).to have_content(review_2.content)
      expect(page).to have_content("User Rating: #{review_2.rating}/5")
    end

    expect(@user_1.avg_rtg).to eq(3.5)
    expect(page).to have_content("Average User Rating: #{@user_1.avg_rtg}/5")
  end
end
