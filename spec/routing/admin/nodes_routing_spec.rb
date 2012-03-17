require "spec_helper"

describe Admin::NodesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/nodes").should route_to("admin/nodes#index")
    end

    it "routes to #new" do
      get("/admin/nodes/new").should route_to("admin/nodes#new")
    end

    it "routes to #show" do
      get("/admin/nodes/1").should route_to("admin/nodes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/nodes/1/edit").should route_to("admin/nodes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/nodes").should route_to("admin/nodes#create")
    end

    it "routes to #update" do
      put("/admin/nodes/1").should route_to("admin/nodes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/nodes/1").should route_to("admin/nodes#destroy", :id => "1")
    end

  end
end
