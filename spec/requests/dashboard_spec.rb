require 'spec_helper'

describe "Dashboard" do
  let(:project1) { Factory(:project, repo: "repo#{Time.zone.now.to_i}@git.com") }
  let(:project2) { Factory(:project, repo: "repo#{Time.zone.now.to_i + 1}@git.com") }

  before do
    OrganizationHelper.default_id = 1
    Factory(:build, project_id: project1.id)
    Factory(:build, project_id: project1.id)
    Factory(:build, project_id: project2.id)
    Factory(:build, project_id: project2.id)
    Factory(:project, repo: "repo#{Time.zone.now.to_i + 2}@git.com")
  end

  describe "GET /organizations/1" do
    it "returns all current projects" do
      get organization_projects_path(1)
      response.status.should be(200)
    end
  end
end
