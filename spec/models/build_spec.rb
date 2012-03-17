require 'spec_helper'

describe Build do
  let(:project) { Factory(:project)}
  before do
    OrganizationHelper.default_id = 1
  end
  describe "#create" do
    it "enqueues new deployment" do
      #Resque.should_receive(:enqueue).with Async::Deploy, project.id, anything
      build = Build.create(project_id: project.id)
      Async::Deploy.should have_queued(project.id, build.id)
    end
  end

  describe "#state_machine" do
    context "creating a new build" do
      it "enqueues the deployment job" do
        build = Build.create(project_id: project.id)
        build.state.should == "enqueued"
      end
    end
  end
end
