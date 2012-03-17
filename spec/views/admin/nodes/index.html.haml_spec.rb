require 'spec_helper'

describe "admin/nodes/index" do
  before(:each) do
    assign(:nodes, [
      stub_model(Node,
        :name => "Name",
        :ip => "Ip",
        :status => "Status",
        :max_workers => 1
      ),
      stub_model(Node,
        :name => "Name",
        :ip => "Ip",
        :status => "Status",
        :max_workers => 1
      )
    ])
  end

  it "renders a list of nodes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
