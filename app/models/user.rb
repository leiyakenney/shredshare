class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :picture, PictureUploader
  validates_presence_of :user_name, :first_name, :last_name, :email
  validates_uniqueness_of :user_name

  after_initialize :set_defaults

  def set_defaults
    self.picture_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7jFbjBxexVsYsryQaYhSHZ2XSo5Li-pLVAU5nxt2qWqjXkS5d&s" if picture.nil?
  end
end
