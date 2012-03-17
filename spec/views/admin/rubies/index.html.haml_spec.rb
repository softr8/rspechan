require 'spec_helper'

describe "admin/rubies/index" do
  before(:each) do
    assign(:rubies, [
      stub_model(Ruby,
        :name => "Name",
        :status => "Status"
      ),
      stub_model(Ruby,
        :name => "Name",
        :status => "Status"
      )
    ])
  end

  it "renders a list of admin_rubies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
