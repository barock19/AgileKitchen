# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story_recipe do
    story_id 1
    description "MyText"
    actor_id 1
    initiator_id 1
  end
end
