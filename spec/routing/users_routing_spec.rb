require "spec_helper"

describe UsersController do
  describe "routing" do

    it "/user routes to #index" do
      get("/user").should route_to("users#index")
    end

    it "/user/settings routes to #settings" do
      get("/user/settings").should route_to("users#settings")
    end

    it "/user/settings routes to #save_settings" do
      put("/user/settings").should route_to("users#save_settings")
    end

    it "/signup routes to #new" do
      get("/signup").should route_to("users#new")
    end

    it "routes to #create" do
      post("/users").should route_to("users#create")
    end
  end
end
