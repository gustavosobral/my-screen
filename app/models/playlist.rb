class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :terminals
  has_many :playlist_items, -> { order(:position) }, dependent: :destroy

  validates :user,        presence: true
  validates :title,       presence: true, length: { maximum: 45 }
  validates :description, length: { maximum: 255 }
  validates :duration,    numericality: { greater_than: 1 }
end
