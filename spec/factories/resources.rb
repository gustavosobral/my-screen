FactoryGirl.define do
  factory :resource do
    user
    title         { Faker::Lorem.characters(20) }
    description   { Faker::Lorem.characters(120) }
    file          { Faker::File::Letters }
  end
end
