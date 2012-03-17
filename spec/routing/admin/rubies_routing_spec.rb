require "spec_helper"

describe Admin::RubiesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/rubies").should route_to("admin/rubies#index")
    end

    it "routes to #new" do
      get("/admin/rubies/new").should route_to("admin/rubies#new")
    end

    it "routes to #show" do
      get("/admin/rubies/1").should route_to("admin/rubies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/rubies/1/edit").should route_to("admin/rubies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/rubies").should route_to("admin/rubies#create")
    end

    it "routes to #update" do
      put("/admin/rubies/1").should route_to("admin/rubies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/rubies/1").should route_to("admin/rubies#destroy", :id => "1")
    end

  end
end
