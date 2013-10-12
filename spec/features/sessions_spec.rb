require 'spec_helper'

feature "Visitor logs in" do
	let!(:user) { FactoryGirl.create :user }

	scenario "with valid info" do
		visit root_path
		page.find(:css, 'div.signin').fill_in 'user_email', with: user.email
		page.find(:css, 'div.signin').fill_in 'user_password', with: user.password
		click_button 'Login'
		expect(page).to have_content("Log Out")
	end

	scenario "without a password" do
		visit root_path
		page.find(:css, 'div.signin').fill_in 'user_email', with: user.email
		page.find(:css, 'div.signin').fill_in 'user_password', with: ''
		click_button 'Login'
		expect(page).to have_content("Please try again")
	end

	scenario "without a valid email" do
		visit root_path
		page.find(:css, 'div.signin').fill_in 'user_email', with: ''
		page.find(:css, 'div.signin').fill_in 'user_password', with: user.password
		click_button 'Login'
		expect(page).to have_content("Please try again")
	end

end
