require 'spec_helper'

feature "Visitor signs up" do

	scenario "without email address" do
		visit root_path
		page.find(:css, 'div.signup').fill_in 'user_password', with: 'password'
		page.find(:css, 'div.signup').fill_in 'user_password_confirmation', with: 'password'
		click_button 'Sign up'
		expect(page).to have_content("Email can't be blank")
	end

	scenario "with valid info" do
		visit root_path
		page.find(:css, 'div.signup').fill_in 'user_email', with: 'bob@bob.com'
		page.find(:css, 'div.signup').fill_in 'user_password', with: 'password'
		page.find(:css, 'div.signup').fill_in 'user_password_confirmation', with: 'password'
		click_button 'Sign up'
		expect(page).to have_content("First, add contacts to your Jailbird address book.")
	end

end
