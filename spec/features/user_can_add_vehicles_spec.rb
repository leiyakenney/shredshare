require 'rails_helper'

describe "A user visits '/profile': " do
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

  it "they see link to add a vehicle" do
    visit '/profile'
    expect(current_path).to eq('/profile')

    expect(page).to have_link('Add A Vehicle')
  end

  it "they are taken to a form when they click on 'Add A Vehicle'" do
    binding.pry
    visit '/profile'
    expect(page).to have_link('Add A Vehicle')
    click_on 'Add A Vehicle'
    # expect(current_path).to eq(new_user_vehicle_path(@user.id))
    # save_and_open_page

    # check('AWD')
    # check('Storage Rack')
    # fill_in 'Total Number of Seats', with: 4
  end
end

# When I click on 'Add A Vehicle', I should be taken to 'user/vehicles#new'
# I should see a form with the following fields:
#
# AWD? (checkboxes: Yes No)
# Storage Rack? (checkboxes: Yes No)
# Total Number of Seats (including driver)
# Click on Submit
# I should see the new vehicle and all previously added vehicles on 'user/vehicles#index'
