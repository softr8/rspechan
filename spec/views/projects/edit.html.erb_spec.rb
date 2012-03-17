require 'spec_helper'

describe "projects/edit" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "MyString",
      :repo => "MyString",
      :organization_id => 1,
      :description => "MyText",
      :ruby_version => "MyString"
    ))
    @organization = assign(:organization, stub_model(Organization,
                                               id: 1,
                                               name: 'Crowd interactive'))
  end


  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => organization_projects_path(organization_id: 1, project_id: @project.id), :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "input#project_repo", :name => "project[repo]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "input#project_ruby_version", :name => "project[ruby_version]"
    end
  end
end
