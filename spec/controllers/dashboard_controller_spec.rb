require 'spec_helper'

describe DashboardController do
  let(:project1) { Factory(:project) }
  let(:project2) { Factory(:project) }

  before do
    Factory(:build, project_id: project1.id)
    Factory(:build, project_id: project1.id)
    Factory(:build, project_id: project2.id)
    Factory(:build, project_id: project2.id)
  end

  describe "#index" do
    it "returns last build per project" do
      get :index
      assigns(:feeds).size.should == 2
    end
  end
end
