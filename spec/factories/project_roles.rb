# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_role do
    project_id 1
    name "MyString"
    regulation "MyText"
  end
end
