class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2
         ]
  mount_uploader :picture, PictureUploader

  has_many :vehicles
  has_many :reviews, :dependent => :destroy
  has_many :trips
  has_many :rides

  validates_presence_of :user_name, :first_name, :last_name, :email
  validates_uniqueness_of :user_name

  def avg_rtg
    reviews.average(:rating)
  end

  def has_vehicles?
    vehicles.any?
  end

  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
      user.email = auth.info.email
      user.user_name = auth.info.name
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
