require 'spec_helper'

describe "admin/nodes/show" do
  before(:each) do
    @node = assign(:node, stub_model(Node,
      :name => "Name",
      :ip => "Ip",
      :status => "Status",
      :max_workers => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ip/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
