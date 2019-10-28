require 'rails_helper'

describe "A user visits '/profile' " do
  before :each do

    @user = User.create!(user_name: "jerry_of_the_day", first_name: "Jerry", last_name: "Jones", pass:"Epic", bio: "Hi, my name is Jerry.", email: "jerry@email.com", password: 'password')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit user_path(@user.id)

  end

  it "they see link to add a vehicle" do
    expect(current_path).to eq(user_path(@user.id))

    expect(page).to have_link('Add A Vehicle')
  end

  it "they are taken to a form when they click on 'Add A Vehicle'" do
    visit user_path(@user.id)
    expect(page).to have_link('Add A Vehicle')
    click_on 'Add A Vehicle'
    expect(current_path).to eq(new_user_vehicle_path(@user.id))

    fill_in 'Make', with: 'Toyota'
    fill_in 'Model', with: 'Tacoma'
    fill_in 'Year', with: '2001'
    check('Awd')
    check('Storage rack')
    fill_in 'Total seats', with: 4

    click_on "Add Vehicle"

    expect(current_path).to eq(user_vehicles_path(@user.id))

    expect(page).to have_content('Total Vehicles 1')

    within(first('.vehicle')) do
      expect(page).to have_css('.make')
      expect(page).to have_css('.model')
      expect(page).to have_css('.year')
      expect(page).to have_css('.awd')
      expect(page).to have_css('.storage_rack')
      expect(page).to have_css('.total_seats')
    end
  end
end
