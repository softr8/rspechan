require "spec_helper"

describe BuildsController do
  describe "routing" do

    it "routes to #index" do
      get("/organizations/1/projects/1/builds").should route_to("builds#index", organization_id: "1", project_id: "1")
    end

    it "routes to #show" do
      get("/organizations/1/projects/1/builds/1").should route_to("builds#show", organization_id: "1", id: "1", project_id: "1")
    end

  end
end
