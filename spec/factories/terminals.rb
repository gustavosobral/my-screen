FactoryGirl.define do
  factory :terminal do
    title 'my-terminal-01'
    user
    password  { Faker::Internet.password }
  end
end
