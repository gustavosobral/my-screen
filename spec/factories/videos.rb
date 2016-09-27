FactoryGirl.define do
  factory :video do
    user
    title       { Faker::Lorem.characters(20) }
    description { Faker::Lorem.characters(120) }
    file do
      file = File.join(Rails.root, 'spec', 'fixtures', 'SampleVideo_1280x720_1mb.mp4')
      Rack::Test::UploadedFile.new(file)
    end
  end

  factory :invalid_video_format, parent: :video do
    file do
      file = File.join(Rails.root, 'spec', 'fixtures', 'SampleVideo_1280x720_1mb.mkv')
      Rack::Test::UploadedFile.new(file)
    end
  end
end
