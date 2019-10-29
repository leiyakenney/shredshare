require 'rails_helper'

describe "as a user" do
  before :each do
    @user_name = "jerry_of_the_day"
    @first_name = "Jerry"
    @last_name = "Jones"
    @pass = "Epic"
    @bio = "Just got to send it bro!"
    @sport_type = "ski"
    @email = "jerry@email.com"


    visit new_user_registration_path

    fill_in 'User name', with: @user_name
    fill_in 'First name', with: @first_name
    fill_in 'Last name', with: @last_name
    fill_in 'Email', with: @email
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Bio', with: @bio
    click_button 'Send It'
  end

  it "I can log out and sign back in" do
    within('#menuToggle') do
      click_on 'Logout'
    end
    expect(current_path).to eq('/')
    click_on "Log In"
    fill_in 'Email', with: @email
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content(@user_name)
  end
end
