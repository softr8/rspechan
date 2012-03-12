FactoryGirl.define do
  sequence :project_name do |n|
    "test#{n}@abc.com"
  end

  sequence :repo_name do |n|
    "repo#{n}@gitrepos.com"
  end

  factory :project do
    name { FactoryGirl.generate(:project_name) }
    repo { FactoryGirl.generate(:repo_name) }
  end
end