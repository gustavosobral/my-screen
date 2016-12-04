class Terminal < ActiveRecord::Base
  belongs_to :user
  belongs_to :playlist, counter_cache: true
  has_many   :access_keys, dependent: :nullify

  scope :orderly, -> { order(updated_at: :desc) }

  validates :user,  presence: true
  validates :title, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

  has_secure_password

  def notify!
    self.notified = false
    save!
  end
end
