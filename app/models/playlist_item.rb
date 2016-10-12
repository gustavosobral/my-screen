class PlaylistItem < ActiveRecord::Base
  belongs_to :resource
  belongs_to :playlist, counter_cache: true

  validates :resource, presence: true
  validates :duration, numericality: { greater_than: 1 }
  validates :position, numericality: { greater_than_or_equal_to: 0 }

  def as_json
    {
      position: self.position,
      duration: self.duration,
      type:     self.resource.class.to_s,
      file_url: resource.file_url
    }
  end
end
