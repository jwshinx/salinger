require "spec_helper"

describe MinesController do
  describe "routing" do

    it "routes to #index" do
      get("/mines").should route_to("mines#index")
    end

    it "routes to #new" do
      get("/mines/new").should route_to("mines#new")
    end

    it "routes to #show" do
      get("/mines/1").should route_to("mines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mines/1/edit").should route_to("mines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mines").should route_to("mines#create")
    end

    it "routes to #update" do
      put("/mines/1").should route_to("mines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mines/1").should route_to("mines#destroy", :id => "1")
    end

  end
end
