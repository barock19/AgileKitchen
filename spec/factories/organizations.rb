# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization do
    name "MyString"
    url "MyString"
    bio "MyString"
    initiator_id 1
  end
end
