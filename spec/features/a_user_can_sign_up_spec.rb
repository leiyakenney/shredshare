require 'rails_helper'

describe "as a user" do
  it "I can sign up and become a registered user" do
    user_name = "jerry_of_the_day"
    first_name = "Jerry"
    last_name = "Jones"
    pass = "Epic"
    bio = "Just got to send it bro!"
    sport_type = "ski"
    role = "passenger"
    email = "jerry@email.com"


    visit new_user_registration_path

    fill_in 'User name', with: user_name
    fill_in 'First name', with: first_name
    fill_in 'Last name', with: last_name
    fill_in 'Pass', with: pass
    fill_in 'Sport type', with: sport_type
    fill_in 'Role', with: role
    fill_in 'Email', with: email
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Bio', with: bio
    click_button 'Sign up'

    expect(current_path).to eq(users_path)
    #this path needs to be user_path

    expect(page).to have_content('Welcome! You have signed up successfully.')

    expect(page).to have_css(".user-name")
    expect(page).to have_css(".first-name")
    expect(page).to have_css(".last-name")
    expect(page).to have_css(".pass")
    expect(page).to have_css(".bio")
    expect(page).to have_css(".sport-type")
    expect(page).to have_css(".role")
  end
end
