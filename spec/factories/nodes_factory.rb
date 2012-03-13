FactoryGirl.define do
  sequence :ip_address do |n|
    "192.168.0.#{n}"
  end

  factory :node do
    name "Test"
    ip { FactoryGirl.generate(:project_name) }
  end
end