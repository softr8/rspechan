require 'spec_helper'

describe Project do
  let(:project) { Project.find_by_name('blog') }

  before do
    OrganizationHelper.default_id = 1
  end

  describe ".last_build" do
    it "returns last build from each project" do
      project.builds.create!
      build2 = project.builds.create!
      project.last_build.should == build2
    end

  end
  describe ".latest_feed" do
    it "returns empty if no builds yet" do
      Project.latest_built.first.builds.size.should == 0
    end
  end
end
