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
    fill_in 'Email', with: email
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Bio', with: bio

    click_button 'Send It'

    expect(page).to have_content('Welcome! You have signed up successfully.')

    expect(page).to have_content(user_name)
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
  end
end
