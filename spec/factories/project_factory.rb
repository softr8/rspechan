FactoryGirl.define do
  sequence :project_name do |n|
    "test#{n}@abc.com"
  end

  factory :project do
    name { FactoryGirl.generate(:project_name) }
  end
end