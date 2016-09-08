FactoryGirl.define do
  factory :image do
    title         Faker::Lorem.characters(20)
    description   Faker::Lorem.characters(120)
    file          { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'PbPYzVD.jpg')) }
  end
end
