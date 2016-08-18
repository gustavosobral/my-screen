class User < ActiveRecord::Base
  # Others available are: :confirmable, :lockable,
  # :registerable, :recoverable, :timeoutable and :omniauthable

  devise :database_authenticatable, :rememberable, :trackable, :validatable
end
