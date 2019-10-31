class RemoveFromTrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :ride_over
    remove_column :trips, :date_of_departure
  end
end
