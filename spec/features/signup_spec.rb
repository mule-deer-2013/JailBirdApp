require 'spec_helper'

feature "Sign up" do

	scenario "User submits form without email address" do
		visit root_path
		fill_in 'user_password', with: 'password'
		fill_in 'user_password_confirmation', with: 'password'
		click_button 'Sign up'
		expect(page).to have_content("Email cannot be blank")
	end

	scenario "User completes form with valid info" do
	end

end