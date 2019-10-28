class Vehicle < ApplicationRecord
  belongs_to :user

#I do not think we want to validate presence of storage_rack and awd. I think this would mean that if a user does not have one of these they will be unable to add their car. Maybe? Something to test for.
  validates_presence_of :make, :model, :year, :total_seats
end
