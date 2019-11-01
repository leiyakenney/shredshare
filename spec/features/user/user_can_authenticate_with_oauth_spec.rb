require 'rails_helper'

describe "Google Oauth" do
  it "users sees flash message if login is not successful" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      info: {
        email: '',
        first_name: 'test',
        last_name: 'ing',
        name: 'test ing'
      },
      credentials: {
        token: 'pizza'
      },
      uid: '12345678'
    )

    visit '/'
    click_button 'Log In via Google'
    expect(page).to have_content("Something went wrong. Please try to register instead.")
  end

  it "can connect to Google via OAuth" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      info: {
        email: 'example@gmail.com',
        first_name: 'test',
        last_name: 'ing',
        name: 'test ing'
      },
      credentials: {
        token: 'pizza'
      },
      uid: '12345678'
    )

    visit '/'
    click_button 'Log In via Google'

    expect(page).to_not have_content('Log In via Google')
    expect(page).to have_content("Logout")
  end
end
