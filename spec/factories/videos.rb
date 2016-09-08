FactoryGirl.define do
  factory :video do
    title         Faker::Lorem.sentence(3)
    description   Faker::Lorem.sentence(10)
    file          { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'SampleVideo_1280x720_2mb.mp4')) }
  end
end
