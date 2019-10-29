class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :picture, PictureUploader

  has_many :vehicles
  has_many :reviews, :dependent => :destroy

  validates_presence_of :user_name, :first_name, :last_name, :email
  validates_uniqueness_of :user_name

  def avg_rtg
    reviews.average(:rating)
  end
end
