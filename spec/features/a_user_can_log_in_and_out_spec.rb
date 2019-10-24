require 'rails_helper'

describe "as a user" do
  before :each do
    @user_name = "jerry_of_the_day"
    @first_name = "Jerry"
    @last_name = "Jones"
    @pass = "Epic"
    @bio = "Just got to send it bro!"
    @sport_type = "ski"
    @role = "passenger"
    @email = "jerry@email.com"


    visit new_user_registration_path

    fill_in 'User name', with: @user_name
    fill_in 'First name', with: @first_name
    fill_in 'Last name', with: @last_name
    fill_in 'Pass', with: @pass
    fill_in 'Sport type', with: @sport_type
    fill_in 'Role', with: @role
    fill_in 'Email', with: @email
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Bio', with: @bio
    click_button 'Sign up'
  end

  it "I can log out and sign back in" do
    within('.navbar') do
      click_on 'Logout'
    end
    expect(current_path).to eq('/users/sign_in')
    fill_in 'Email', with: @email
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(current_path).to eq(users_path)
  end
end