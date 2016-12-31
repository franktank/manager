FactoryGirl.define do
  factory :role do
    name { 'Generic Role' }
  end
  factory :admin_role, class: Role do
    name { 'admin' }
  end

  factory :lead_role, class: Role do
    name { 'lead' }
  end

  factory :member_role, class: Role do
    name { 'member' }
  end
end
