class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :terminals
  has_many :playlist_items, -> { order(:position) }, dependent: :destroy
end
