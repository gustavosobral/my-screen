class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :terminals, dependent: :nullify
  has_many :playlist_items, -> { order(:position) }, dependent: :destroy

  scope :orderly, -> { order(updated_at: :desc) }

  validates :user,        presence: true
  validates :title,       presence: true, length: { maximum: 45 }
  validates :description, length: { maximum: 255 }
  validates :duration,    numericality: { greater_than: 0.0 }

  def as_json
    {
      id: self.id,
      title: self.title,
      duration: self.duration,
      updated_at: self.updated_at,
      playlist_items: self.playlist_items.as_json
    }
  end
end
