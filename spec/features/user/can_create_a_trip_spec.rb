require 'rails_helper'

RSpec.describe "A driver can create a trip" do
  describe "Putting cheeks in your seats" do
    before :each do
      @current_user = User.create!(user_name: "jerry_of_the_day",
                                  first_name: "Jerry",
                                  last_name: "Jones",
                                  password: "tester",
                                  pass: "Epic",
                                  bio: "Just got to send it bro!",
                                  sport_type: "ski",
                                  email: "jerry@email.com")
    end
    it "I can click on my link" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
      
    end
  end
end
