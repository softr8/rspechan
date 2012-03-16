require 'spec_helper'

describe Build do
  let(:project) { Factory(:project)}
  describe "#create" do
    it "enqueues new deployment" do
      Resque.should_receive(:enqueue).with Async::Deploy, project.id, anything
      Build.create(project_id: project.id)
    end
  end

  describe "#state_machine" do
    context "creating a new build" do
      it "enqueues the deployment job" do
        build = Build.create(project_id: project.id)
        puts build.inspect
        build.state.should == "enqueued"
      end
    end
  end
end
