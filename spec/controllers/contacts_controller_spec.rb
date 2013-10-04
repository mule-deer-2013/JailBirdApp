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

	context "#create" do
		let(:contact_params) { {contact: {name: Faker::Name.name, phone_number: "17039" + (0..9).to_a.sample(6).join}} }

		it "redirects to sign-in page if not user is signed in" do
			post :create, contact_params
			expect(response).to redirect_to new_user_session_path
		end

		it "redirects to root page with successful contact creation" do
			sign_in :user, user
			post :create, contact_params
			expect(response).to redirect_to root_path
		end

		it "redirects to create new contact page with unsuccessful contact creation" do
			sign_in :user, user
			post :create, {contact: {name: "", phone_number: ""}}
			expect(response).to redirect_to new_contact_path
		end

		it "saves new contact to database with valid contact params" do
			sign_in :user, user
			expect{post :create, contact_params}.to change(Contact, :count).by(1)
		end
	end

end