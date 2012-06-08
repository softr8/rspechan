require 'spec_helper'

describe Api::SpecsController, '#create_failures' do
  let(:build) { Factory.create(:build) }
  let(:valid_params) {
    {
        :specs => [
            {
                :exception => "expected false to be true",
                :build_id => nil,
                :description => "fails",
                :file_path => "rspec/formatters/rspechan_formatter_spec.rb",
                :spec => "RSpec::Formatters::RspechanFormatter#example_failed fails",
                :line => 4
            },
            {
                :exception => "expected false to be true",
                :build_id => nil,
                :description => "unicorns",
                :file_path => "rspec/formatters/rspechan_formatter_spec.rb",
                :spec => "RSpec::Formatters::RspechanFormatter#example_failed awesome unicorns",
                :line => 9
            }
        ].to_json,
        :build_id => build.id
    }
  }

  before do
    build.deployed
  end

  it 'creates specs records' do
    expect {
      post :create_failures, valid_params
    }.to change(SpecTest, :count).by(2)
  end

  it 'marks as failed the build' do
    post :create_failures, valid_params
    build.reload.state.should == "failed"
  end

end
