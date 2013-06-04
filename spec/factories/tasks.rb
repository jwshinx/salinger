# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title "MyString"
    description "MyText"
    updated_by 1
    created_by 1
    due_date "2013-06-03"
    completed_on "2013-06-03"
    completed_by 1
    assigned_to 1
    task_status_id 1
  end
end
