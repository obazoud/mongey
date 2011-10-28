require 'spec_helper'

describe "Homes" do
  describe "GET /" do
    it "should display the homepage" do
      get root_url
      response.status.should be(200)
    end
  end
end
