class Resource < ActiveRecord::Base

  default_scope { order(updated_at: :desc) }

  validates :title, presence: true, length: { maximum: 45 }
  validates :description, presence: true, length: { maximum: 255 }
  validates_presence_of :file
end
