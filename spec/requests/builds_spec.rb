require 'spec_helper'

describe "Builds" do
  describe "GET /builds" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get organization_project_builds_path(1, 1)
      response.status.should be(200)
    end
  end
end
