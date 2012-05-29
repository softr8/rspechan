require 'spec_helper'

describe Api::SpecsController, '#create_failures' do
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
        ].to_json
    }
  }

  it 'creates specs records' do
    expect {
      post :create_failures, valid_params
    }.to change(Spec, :count).by(2)
  end

end
