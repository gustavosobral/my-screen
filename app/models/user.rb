class User < ActiveRecord::Base
  has_many :images,     dependent: :destroy
  has_many :videos,     dependent: :destroy
  has_many :terminals,  dependent: :destroy
  has_many :playlists,  dependent: :destroy

  devise :database_authenticatable, :rememberable, :trackable, :validatable

  scope :orderly, -> { order(updated_at: :desc) }

  validates :name, presence: true, length: { maximum: 50 }
end
