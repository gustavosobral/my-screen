class User < ActiveRecord::Base
  has_many :resources, dependent: :destroy

  # Others available are: :confirmable, :lockable,
  # :registerable, :recoverable, :timeoutable and :omniauthable

  devise :database_authenticatable, :rememberable, :trackable, :validatable
end
