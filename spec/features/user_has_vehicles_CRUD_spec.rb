require 'rails_helper'

describe "A user visits show page: " do
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

    expect(page).to have_content('Total Vehicles: 1')

    within(first('.vehicle')) do
      expect(page).to have_css('.make')
      expect(page).to have_css('.model')
      expect(page).to have_css('.vehicle-year')
      expect(page).to have_css('.awd')
      expect(page).to have_css('.storage_rack')
      expect(page).to have_css('.total_seats')
    end
  end

  it "user should not see 'My Vehicles' if user does not have any vehicles." do
    within('#menuToggle') do
      expect(page).to_not have_link('My Vehicles')
    end
  end

  xit "can access list of vehicles, if they have added any" do
    vehicle = @user.vehicles.create!(make: 'vehicle_1', model: 'model_1', year: '2019', awd: true, storage_rack: true, total_seats: 3)
    vehicle_2 = @user.vehicles.create!(make: 'vehicle_2', model: 'model_2', year: '2019', awd: true, storage_rack: true, total_seats: 3)

    within('#menu') do
      expect(page).to have_link('My Vehicles')
    end
  end

  it "user can go to vehicle show page" do
    vehicle = @user.vehicles.create!(make: 'vehicle_1', model: 'model_1', year: '2019', awd: true, storage_rack: true, total_seats: 3)
    vehicle_2 = @user.vehicles.create!(make: 'vehicle_2', model: 'model_2', year: '2019', awd: true, storage_rack: true, total_seats: 3)
    visit "/users/#{@user.id}/vehicles/#{vehicle.id}"

    expect(page).to have_content(vehicle.make)
    expect(page).to_not have_content(vehicle_2.make)
  end

  it "user can edit a vehicle's information" do
    vehicle = @user.vehicles.create!(make: 'vehicle_1', model: 'model_1', year: '2019', awd: true, storage_rack: true, total_seats: 3)
    visit "/users/#{@user.id}/vehicles/#{vehicle.id}"

    expect(page).to have_link('Edit')
    click_on 'Edit'
    expect(current_path).to eq("/users/#{@user.id}/vehicles/#{vehicle.id}/edit")

    fill_in 'Make', with: 'Lexus'
    fill_in 'Model', with: 'RX 300'
    fill_in 'Year', with: '2019'
    # check('Awd')
    # check('Storage rack')
    fill_in 'Total seats', with: 4

    click_on "Update Vehicle"
  end
end
