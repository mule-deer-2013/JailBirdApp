require 'spec_helper'

# See: http://www.10hacks.com/rspec-capybara-devise-login-tests/

feature "Create contact" do

  scenario "User creates a new widget", js: true do
		visit root_path
		click_button "Login"
		expect(page).to have_text("Sign in")

  #   visit contacts_path
  #   click_button "+ contact"
		# expect(page).to have_text("enter your contact's info")
  end

end
