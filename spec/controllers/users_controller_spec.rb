require 'spec_helper'

describe UsersController do

  def valid_attributes
    FactoryGirl.attributes_for(:user, :currency_id => FactoryGirl.create(:currency).id)
  end

  describe "GET settings" do
    context "when signed in" do
      it "assigns the current user as @user" do
        user = FactoryGirl.create(:user)
        log_in user
        get :settings
        assigns(:user).should eq(user)
      end
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new
      assigns(:user).should be_a_new(User)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, :user => valid_attributes
        }.to change(User, :count).by(1)
      end

      it "redirects to login page" do
        post :create, :user => valid_attributes
        response.should redirect_to(login_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, :user => {}
        assigns(:user).should be_a_new(User)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, :user => {}
        response.should render_template("new")
      end
    end
  end
end
