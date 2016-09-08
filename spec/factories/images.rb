FactoryGirl.define do
  factory :image do
    title         Faker::Lorem.sentence(3)
    description   Faker::Lorem.sentence(10)
    file          { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'PbPYzVD.jpg')) }
  end
end
