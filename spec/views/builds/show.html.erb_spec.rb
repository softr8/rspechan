require 'spec_helper'

describe "builds/show" do
  before(:each) do
    @build = assign(:build, stub_model(Build,
      :state => "State",
      :project_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/State/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
