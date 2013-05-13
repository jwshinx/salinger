require "spec_helper"

describe EmailTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/email_types").should route_to("email_types#index")
    end

    it "routes to #new" do
      get("/email_types/new").should route_to("email_types#new")
    end

    it "routes to #show" do
      get("/email_types/1").should route_to("email_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/email_types/1/edit").should route_to("email_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/email_types").should route_to("email_types#create")
    end

    it "routes to #update" do
      put("/email_types/1").should route_to("email_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/email_types/1").should route_to("email_types#destroy", :id => "1")
    end

  end
end
