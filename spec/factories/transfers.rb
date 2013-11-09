# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transfer do
    user_id 1
    amount 1
    title "MyString"
    description 1
  end
end
