require 'spec_helper'

describe SessionsController do

	describe "#new" do

		it "should render the new sessions template" do
			get :new
			expect(response.status).to eq(200)
		end

	end

	describe "#create" do
		let!(:user) { FactoryGirl.create(:user) }

		it "should login a user with valid inputs" do
			login_params = { sessions: { email: "bob3@bob.com", password: "bob" } }
			post :create, login_params
		end

		it "should not login a user with invalid inputs"

	end

	describe  "#destroy" do

	end
end

