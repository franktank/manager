FactoryGirl.define do
  factory :permission do
    name { 'Add Member' }
    description { 'Allows current user to invite users to the group' }
  end
end
