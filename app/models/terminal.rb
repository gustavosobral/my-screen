class Terminal < ActiveRecord::Base
  belongs_to :user
  belongs_to :playlist, counter_cache: true

  scope :orderly, -> { order(updated_at: :desc) }

  validates :user,  presence: true
  validates :title, presence: true, length: { maximum: 50 }
end
