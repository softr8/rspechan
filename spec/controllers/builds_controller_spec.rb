require 'spec_helper'

describe BuildsController do
  let(:project) { Factory(:project)}

  def valid_attributes
    { project_id: project.id }
  end
  
  def valid_session
    { }
  end

  def default_params
    { organization_id: 1, project_id: project.id }
  end
  before :all do
    OrganizationHelper.default_id = 1
  end

  describe "GET index" do
    it "assigns all builds as @builds" do
      build = Build.create! valid_attributes
      get :index, default_params, valid_session
      assigns(:builds).should include(build)
    end
  end

  describe "GET show" do
    it "assigns the requested build as @build" do
      build = Build.create! valid_attributes
      get :show, default_params.merge(:id => build.to_param), valid_session
      assigns(:build).should eq(build)
    end
  end

  describe "GET enqueue_project_builds" do

    def do_get
      get :enqueue, default_params
    end

    it "Enqueues new build" do
      expect do
        do_get
      end.to change{Build.count}.by(1)
    end
    it "redirects to index" do
      do_get
      response.should redirect_to(organization_path(1))
    end
  end

end
