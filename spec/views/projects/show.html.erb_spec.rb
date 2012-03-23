require 'spec_helper'

describe "projects/show" do
  before(:each) do
    OrganizationHelper.default_id = 1
    @project = Project.find_by_name('blog')
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/blog/)
    rendered.should match(/ruby-1.9.3-rc1/)
  end
end
