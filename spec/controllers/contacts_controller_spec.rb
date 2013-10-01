require 'spec_helper'

describe ContactsController do

	let!(:user) { FactoryGirl.create(:user) }
	let!(:group) { FactoryGirl.create(:group, user: user) }
	let!(:contact) { FactoryGirl.create(:contact, user: user, group_id: group.id) }

	context "#index" do

		it "assigns a user's contacts and groups to instance variables" do
			sign_in :user, user
			get :index
			expect(assigns :contacts).to eq(user.contacts)
			expect(assigns :groups).to eq(user.groups)
		end

		it "returns a 200 response with a user logged in" do
			sign_in :user, user
			get :index
			expect(response.status).to eq(200)
		end

		it "redirects to sign-in page if no user is signed in" do
			get :index
			expect(response).to redirect_to new_user_session_path
		end
	end

	context "#new" do
		it "redirects to sign-in page if not user is signed in" do
			get :new
			expect(response).to redirect_to new_user_session_path
		end

		it "returns a 200 response with a user logged in" do
			sign_in :user, user
			get :new
			expect(response.status).to eq(200)
		end
	end

end