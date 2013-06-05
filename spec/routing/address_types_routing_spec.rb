require "spec_helper"

describe AddressTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/address_types").should route_to("address_types#index")
    end

    it "routes to #new" do
      get("/address_types/new").should route_to("address_types#new")
    end

    it "routes to #show" do
      get("/address_types/1").should route_to("address_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/address_types/1/edit").should route_to("address_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/address_types").should route_to("address_types#create")
    end

    it "routes to #update" do
      put("/address_types/1").should route_to("address_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/address_types/1").should route_to("address_types#destroy", :id => "1")
    end

  end
end
