FactoryGirl.define do
  factory :image do
    user
    title         Faker::Lorem.characters(20)
    description   Faker::Lorem.characters(120)
    file          { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'PbPYzVD.jpg')) }
  end

  factory :invalid_image_format, parent: :image do
    file          { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', '120430.gif')) }
  end
end
