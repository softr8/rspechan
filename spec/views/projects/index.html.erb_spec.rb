require 'spec_helper'

describe "projects/index" do
  before(:each) do
    OrganizationHelper.default_id = 1
    assign(:projects, [Project.find_by_name('fulcrum'), Project.find_by_name('blog')])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "fulcrum".to_s, :count => 1
  end
end
