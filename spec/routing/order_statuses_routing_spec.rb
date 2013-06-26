require "spec_helper"

describe OrderStatusesController do
  describe "routing" do

    it "routes to #index" do
      get("/order_statuses").should route_to("order_statuses#index")
    end

    it "routes to #new" do
      get("/order_statuses/new").should route_to("order_statuses#new")
    end

    it "routes to #show" do
      get("/order_statuses/1").should route_to("order_statuses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/order_statuses/1/edit").should route_to("order_statuses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/order_statuses").should route_to("order_statuses#create")
    end

    it "routes to #update" do
      put("/order_statuses/1").should route_to("order_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/order_statuses/1").should route_to("order_statuses#destroy", :id => "1")
    end

  end
end
