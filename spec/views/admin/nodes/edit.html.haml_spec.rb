require 'spec_helper'

describe "admin/nodes/edit" do
  before(:each) do
    @node = assign(:node, stub_model(Node,
      :name => "MyString",
      :ip => "MyString",
      :status => "MyString",
      :max_workers => 1
    ))
  end

  it "renders the edit node form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_nodes_path(@node), :method => "post" do
      assert_select "input#node_name", :name => "node[name]"
      assert_select "input#node_ip", :name => "node[ip]"
      assert_select "input#node_status", :name => "node[status]"
      assert_select "input#node_max_workers", :name => "node[max_workers]"
    end
  end
end
