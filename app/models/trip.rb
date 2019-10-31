class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  belongs_to :rtd_location
  has_many :rides, :dependent => :delete_all

  validates_presence_of :seats_available
  validates_presence_of :vehicle_id
  validates_presence_of :rtd_location_id
  validates_presence_of :destination_point
  validates_presence_of :ride_type

end
