require "spec_helper"

describe ProjectsController do
  describe "routing" do

    it "routes to #index" do
      get("/organizations/1/projects").should route_to("projects#index", organization_id: "1")
    end

    it "routes to #new" do
      get("/organizations/1/projects/new").should route_to("projects#new", organization_id: "1")
    end

    it "routes to #show" do
      get("/organizations/1/projects/1").should route_to("projects#show", organization_id: "1", :id => "1")
    end

    it "routes to #edit" do
      get("/organizations/1/projects/1/edit").should route_to("projects#edit", organization_id: "1", :id => "1")
    end

    it "routes to #create" do
      post("/organizations/1/projects").should route_to("projects#create", organization_id: "1")
    end

    it "routes to #update" do
      put("/organizations/1/projects/1").should route_to("projects#update", organization_id: "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/organizations/1/projects/1").should route_to("projects#destroy", organization_id: "1", :id => "1")
    end

  end
end
