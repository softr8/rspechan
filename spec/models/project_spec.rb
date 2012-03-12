require 'spec_helper'

describe Project do
  let(:project) { Factory(:project)}

  describe ".latest_feed" do
    let(:build1) { Factory(:build, project: project)}
    let(:build2) { Factory(:build, project: project)}

    it "returns empty if no builds yet" do
      Project.latest_built.size.should == 0
    end

    it "returns last build from each project" do
      build1
      build2
      Project.latest_built.first.last_build.should == build2
    end
  end
end
