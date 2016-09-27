class PlaylistItem < ActiveRecord::Base
  belongs_to :resource
  belongs_to :playlist, counter_cache: true

  validates :resource, presence: true
  validates :duration, numericality: { greater_than: 1 }
  validates :position, numericality: { greater_than_or_equal_to: 0 }
end
