FactoryGirl.define do
  factory :video do
    file          { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'SampleVideo_1280x720_2mb.mp4')) }
    title         Faker::Lorem.characters(20)
    description   Faker::Lorem.characters(120)
  end
end
