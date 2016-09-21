class Resource < ActiveRecord::Base
  belongs_to :user
  has_many :playlist_items, dependent: :destroy

  default_scope { order(updated_at: :desc) }

  validates :user,        presence: true
  validates :title,       presence: true, length: { maximum: 45 }
  validates :description, presence: true, length: { maximum: 255 }
  validates_presence_of   :file
end
