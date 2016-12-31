FactoryGirl.define do
  factory :membership do
    association :user
    association :group
  end

  factory :membership_with_role, class: Membership do
    association :user
    association :group
    association :member_role
  end
end
