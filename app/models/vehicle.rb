class Vehicle < ApplicationRecord
  belongs_to :user

  validates_presence_of :make, :model, :year, :awd, :storage_rack, :total_seats
end
