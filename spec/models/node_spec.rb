require 'spec_helper'

describe Node do
  describe "#create" do
    it "enqueues new node provision" do
      node = Factory(:node)
      Async::Provision.should have_queued(node.ip)
    end
  end

  describe "#state_machine" do
    it "creates new node in queued state" do
      node = Factory(:node)
      node.status.should == 'enqueued'
    end

    it "marks as failed if provisioning fails" do
      node = Factory(:node)
      node.failed!
      node.reload.status.should == 'failed'
    end
    it "marks as provisioned if provisioning is a success" do
      node = Factory(:node)
      node.provisioned
      node.status.should == 'provisioned'
    end
  end
end
