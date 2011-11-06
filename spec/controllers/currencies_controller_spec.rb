require 'spec_helper'

describe CurrenciesController do

  def valid_attributes
    FactoryGirl.attributes_for(:currency)
  end

  describe "GET index" do
    before do
      Currency.delete_all
    end

    it "assigns all currencies as @currencies" do
      currency = Currency.create! valid_attributes
      get :index
      assigns(:currencies).should eq([currency])
    end
  end

  describe "GET show" do
    it "assigns the requested currency as @currency" do
      currency = Currency.create! valid_attributes
      get :show, :id => currency.id
      assigns(:currency).should eq(currency)
    end
  end

  describe "GET new" do
    it "assigns a new currency as @currency" do
      get :new
      assigns(:currency).should be_a_new(Currency)
    end
  end

  describe "GET edit" do
    it "assigns the requested currency as @currency" do
      currency = Currency.create! valid_attributes
      get :edit, :id => currency.id
      assigns(:currency).should eq(currency)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Currency" do
        expect {
          post :create, :currency => valid_attributes
        }.to change(Currency, :count).by(1)
      end

      it "assigns a newly created currency as @currency" do
        post :create, :currency => valid_attributes
        assigns(:currency).should be_a(Currency)
        assigns(:currency).should be_persisted
      end

      it "redirects to the created currency" do
        post :create, :currency => valid_attributes
        response.should redirect_to(Currency.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved currency as @currency" do
        # Trigger the behavior that occurs when invalid params are submitted
        Currency.any_instance.stub(:save).and_return(false)
        post :create, :currency => {}
        assigns(:currency).should be_a_new(Currency)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Currency.any_instance.stub(:save).and_return(false)
        post :create, :currency => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested currency" do
        currency = Currency.create! valid_attributes
        # Assuming there are no other currencies in the database, this
        # specifies that the Currency created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Currency.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => currency.id, :currency => {'these' => 'params'}
      end

      it "assigns the requested currency as @currency" do
        currency = Currency.create! valid_attributes
        put :update, :id => currency.id, :currency => valid_attributes
        assigns(:currency).should eq(currency)
      end

      it "redirects to the currency" do
        currency = Currency.create! valid_attributes
        put :update, :id => currency.id, :currency => valid_attributes
        response.should redirect_to(currency)
      end
    end

    describe "with invalid params" do
      it "assigns the currency as @currency" do
        currency = Currency.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Currency.any_instance.stub(:save).and_return(false)
        put :update, :id => currency.id, :currency => {}
        assigns(:currency).should eq(currency)
      end

      it "re-renders the 'edit' template" do
        currency = Currency.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Currency.any_instance.stub(:save).and_return(false)
        put :update, :id => currency.id, :currency => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested currency" do
      currency = Currency.create! valid_attributes
      expect {
        delete :destroy, :id => currency.id
      }.to change(Currency, :count).by(-1)
    end

    it "redirects to the currencies list" do
      currency = Currency.create! valid_attributes
      delete :destroy, :id => currency.id
      response.should redirect_to(currencies_url)
    end
  end

end
