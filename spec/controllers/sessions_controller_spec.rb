require 'spec_helper'

describe SessionsController do

  describe "#new" do

    it "should render the new sessions template" do
      get :new
      expect(response.status).to eq(200)
    end

  end

  describe "#create" do
    let!(:user) { User.create(username: "Bob", email: "bob3@bob.com" , password: "bob" ) }
    context "with valid params" do
      let(:login_params) { { email: "bob3@bob.com", password: "bob" } }
      subject { post :create, login_params }

      it "should login a user" do
        subject.should redirect_to root_path
      end
    end

    context "without valid params" do
      let(:login_params) { { email: "bob3@bob.com", password: "" } }
      subject { post :create, login_params }
      it "should not login a user with invalid inputs" do
        subject.should redirect_to new_session_path
      end
    end
  end

  describe  "#destroy" do
  	it "should redirect to the homepage" do
  		delete :destroy
  	  expect(response.status).to eq(302)
    end
  end
end
