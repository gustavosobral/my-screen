FactoryGirl.define do
  factory :playlist_item do
    playlist
    resource
    sequence(:position)
    duration 1.5
  end
end
