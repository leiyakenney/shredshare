class Vehicle < ApplicationRecord
  belongs_to :user

  validates_presence_of :awd, :storage_rack, :total_number_seats
end
