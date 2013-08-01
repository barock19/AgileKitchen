# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    project_id 1
    short_desc "MyString"
    long_desc "MyText"
    initiator_id 1
    actor_id 1
  end
end
