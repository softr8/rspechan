FactoryGirl.define do
  sequence :project_name do |n|
    "test#{n}@abc.com"
  end

  sequence :repo_name do |n|
    "repo#{Time.now.to_i}@gitrepos.com"
  end

  factory :project do
    name { FactoryGirl.generate(:project_name) }
    repo { FactoryGirl.generate(:repo_name) }
    organization_id 1
  end
end