require 'spec_helper'

describe DashboardController do
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

  describe "#index" do
    it "returns last build per project" do
      get :index, { organization_id: 1 }
      assigns(:feeds).size.should == 3
    end
  end
end
