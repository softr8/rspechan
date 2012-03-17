require 'spec_helper'

describe "Projects" do
  describe "GET /projects" do
    it "works! (now write some real specs)" do
      get organization_projects_path(1)
      response.status.should be(200)
    end
  end
end
