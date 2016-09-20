class Terminal < ActiveRecord::Base
  belongs_to :user
  belongs_to :playlist

  validates :user,  presence: true
  validates :title, presence: true, length: { maximum: 50 }
end
