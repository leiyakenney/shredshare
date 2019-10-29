class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :picture, PictureUploader
  validates_presence_of :user_name, :first_name, :last_name, :email
  validates_uniqueness_of :user_name

  has_many :vehicles

end
