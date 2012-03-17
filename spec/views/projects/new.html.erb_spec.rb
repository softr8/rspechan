require 'spec_helper'

describe "projects/new" do
  before(:each) do
    OrganizationHelper.default_id = 1
    assign(:project, stub_model(Project,
      :name => "MyString",
      :repo => "MyString",
      :description => "MyText",
      :ruby_id => 1
    ).as_new_record)
    assign(:organization, Organization.find_or_create_by_name(name: "Crowd Interactive"))
  end

  it "renders new project form" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => organization_projects_path(1), :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "input#project_repo", :name => "project[repo]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "select#project_ruby_id", :name => "project[ruby_id]"
    end
  end
end
