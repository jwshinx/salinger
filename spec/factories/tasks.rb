# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title "Wash Dishes"
    description "asap"
    updated_by 1
    created_by 1
    due_date Date.today 
    completed_on Date.today 
    completed_by 1
    assigned_to 1
    task_status_id 1
  end
end
