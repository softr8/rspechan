require 'spec_helper'

describe "admin/rubies/show" do
  before(:each) do
    @ruby = assign(:ruby, stub_model(Ruby,
      :name => "Name",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
  end
end
