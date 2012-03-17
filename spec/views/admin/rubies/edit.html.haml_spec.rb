require 'spec_helper'

describe "admin/rubies/edit" do
  before(:each) do
    @ruby = assign(:ruby, stub_model(Ruby,
      :name => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit ruby form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_rubies_path(@ruby), :method => "post" do
      assert_select "input#ruby_name", :name => "ruby[name]"
      assert_select "input#ruby_status", :name => "ruby[status]"
    end
  end
end
