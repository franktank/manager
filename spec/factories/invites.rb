FactoryGirl.define do
  factory :invite do
    email { Faker::Internet.email }
    association :group
    association :sender, factory: :user
  end
end
