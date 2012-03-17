require 'spec_helper'

describe "projects/index" do
  before(:each) do
    OrganizationHelper.default_id = 1
    assign(:projects, [
      stub_model(Project,
        :name => "Name",
        :repo => "Repo",
        :description => "MyText",
        :ruby_version => "Ruby Version"
      ),
      stub_model(Project,
        :name => "Name",
        :repo => "Repo",
        :description => "MyText",
        :ruby_version => "Ruby Version"
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Repo".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ruby Version".to_s, :count => 2
  end
end
