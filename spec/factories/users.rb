FactoryGirl.define do
  factory :user do
    name      { Faker::Name.name }
    email     { Faker::Internet.email }
    password  { Faker::Internet.password }
  end

  factory :admin_user, parent: :user do
    admin true
  end
end
