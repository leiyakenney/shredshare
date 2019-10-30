class RtdLocation < ApplicationRecord

  # validates :place_id, uniqueness: true
  validates_presence_of :area, :name, :address
  
end
