# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sprint do
    start_at "2013-08-18 16:44:11"
    end_at "2013-08-18 16:44:11"
    title "MyString"
    initiator_id 1
    description "MyText"
  end
end
