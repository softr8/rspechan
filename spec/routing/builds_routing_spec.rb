require "spec_helper"

describe BuildsController do
  describe "routing" do

    it "routes to #index" do
      get("/projects/1/builds").should route_to("builds#index", project_id: "1")
    end

    it "routes to #show" do
      get("/projects/1/builds/1").should route_to("builds#show", id: "1", project_id: "1")
    end

  end
end
