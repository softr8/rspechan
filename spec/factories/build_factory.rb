FactoryGirl.define do
  factory :build do
    association(:project, :factory => :project)
  end
end