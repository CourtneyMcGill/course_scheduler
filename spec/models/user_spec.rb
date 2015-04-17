require 'rails_helper'

#@request.env["devise.mapping"] = Devise.mappings[:user]

RSpec.describe User, type: :model do
  before :each do
    @user = User.create! {
	:email => "dmiller1529@gmail.com"
        :username => "dmiller1529"
        :password => "1234abcd"
        :password_confirmation => "1234abcd"
	:provider => "github"
	:uid => 56778
    }
    end

    context "the create user method" do
	it "should show that user has a correct email" do
	  expect(@user.email).to match("dmiller1529@gmail.com")
	end

	it "should show that the user has a correct username" do
	  expect(@user.username).to match("dmiller1529")
	end

	it "should show that the user has the correct password" do
	  expect(@user.password).to match("1234abcd")
	end

	it "should show that the password confirmation matches the password" do
	  expect(@user.password_confirmation).to match("1234abcd")
	end
    end
end
