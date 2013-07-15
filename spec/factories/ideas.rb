# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea do
    title "MyString"
    description "MyString"
    score 1
    user nil
  end
end
