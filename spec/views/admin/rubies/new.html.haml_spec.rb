require 'spec_helper'

describe "admin/rubies/new" do
  before(:each) do
    assign(:ruby, stub_model(Ruby,
      :name => "MyString",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new ruby form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_rubies_path, :method => "post" do
      assert_select "input#ruby_name", :name => "ruby[name]"
      assert_select "input#ruby_status", :name => "ruby[status]"
    end
  end
end
