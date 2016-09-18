FactoryGirl.define do
  factory :video do
    user
    title         Faker::Lorem.characters(20)
    description   Faker::Lorem.characters(120)
    file          { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'SampleVideo_1280x720_1mb.mp4')) }
  end

  factory :invalid_video_format, parent: :video do
    file          { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'SampleVideo_1280x720_1mb.mkv')) }
  end
end
