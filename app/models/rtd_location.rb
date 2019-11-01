class RtdLocation < ApplicationRecord
  has_many :trips
  # validates :place_id, uniqueness: true
  validates_presence_of :area, :name, :address

end
