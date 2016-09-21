FactoryGirl.define do
  factory :playlist do
    user
    title         { Faker::Lorem.characters(20) }
    duration      1.5
  end
end
