require 'spec_helper'

describe "Authentications" do
  context "Clicking the login link" do
    it "Login button should log in" do
      visit root_path
      click_link "Login"
      page.should have_link "Logout"
    end
  end
end