require 'spec_helper'

describe BuildsController do

  def valid_attributes
    {}
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all builds as @builds" do
      build = Build.create! valid_attributes
      get :index, {}, valid_session
      assigns(:builds).should eq([build])
    end
  end

  describe "GET show" do
    it "assigns the requested build as @build" do
      build = Build.create! valid_attributes
      get :show, {:id => build.to_param}, valid_session
      assigns(:build).should eq(build)
    end
  end

  describe "GET enqueue_project_builds" do
    let(:project) { Factory(:project)}

    def do_get
      get :enqueue, project_id: project.id
    end

    it "Enqueues new build" do
      expect do
        do_get
      end.to change{Build.count}.by(1)
    end
    it "redirects to index" do
      do_get
      response.should redirect_to(:root)
    end
  end

end
