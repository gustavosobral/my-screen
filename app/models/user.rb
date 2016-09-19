class User < ActiveRecord::Base
  has_many :resources, dependent: :destroy
  has_many :terminals, dependent: :destroy

  devise :database_authenticatable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
end
