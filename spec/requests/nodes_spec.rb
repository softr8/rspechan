require 'spec_helper'

describe "Nodes" do
  describe "GET /nodes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get nodes_path, organization_id: 1
      response.status.should be(200)
    end
  end
end
