require 'spec_helper'

describe UsersController do
  
  describe '#new' do

    let(:user) { User.new }

    it "should render the new user template" do
      get :new
      expect(response.status).to eq 200
    end

    # it "should assign a new user to @user" do
    # 	user
    #   get :new
    #   expect(assigns(:user)).to eq(user)
    # end

  end

  describe '#create' do

    context "with valid inputs" do
    	let(:user_params) { { user: {name: "Bob", email: "bob3@bob.com" , password: "bob" } } }
    	subject { post :create, user_params }

      it "should redirect to root on successful account creation" do
        subject.should redirect_to(root_path)
      end

      it "should create a new user" do
      	expect{
      		post :create, user_params
      	}.to change(User, :count).by(1)
      end

    end

    context "with invalid inputs" do
    	let(:user_params) { { user: {name: "", email: "" , password: "" } } }
    	subject { post :create, user_params }

    	it "should redirect to signup form" do
    		subject.should redirect_to(new_user_path)
    	end

    	it "should not create a new user" do
    		expect{
      		post :create, user_params
      	}.to_not change(User, :count)
    	end

    end

  end

end
