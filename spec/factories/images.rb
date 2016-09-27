FactoryGirl.define do
  factory :image do
    user
    title       { Faker::Lorem.characters(20) }
    description { Faker::Lorem.characters(120) }
    file do
      file = File.join(Rails.root, 'spec', 'fixtures', 'PbPYzVD.jpg')
      Rack::Test::UploadedFile.new(file)
    end
  end

  factory :invalid_image_format, parent: :image do
    file do
      file = File.join(Rails.root, 'spec', 'fixtures', '120430.gif')
      Rack::Test::UploadedFile.new(file)
    end
  end
end
