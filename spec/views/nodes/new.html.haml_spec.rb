require 'spec_helper'

describe "nodes/new" do
  before(:each) do
    assign(:node, stub_model(Node,
      :name => "MyString",
      :ip => "MyString",
      :status => "MyString",
      :max_workers => 1
    ).as_new_record)
  end

  it "renders new node form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nodes_path, :method => "post" do
      assert_select "input#node_name", :name => "node[name]"
      assert_select "input#node_ip", :name => "node[ip]"
      assert_select "input#node_status", :name => "node[status]"
      assert_select "input#node_max_workers", :name => "node[max_workers]"
    end
  end
end
