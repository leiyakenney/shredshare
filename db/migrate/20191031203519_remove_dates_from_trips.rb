class RemoveDatesFromTrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :day_of_trip
    remove_column :trips, :month_of_trip
    remove_column :trips, :year_of_trip
  end
end
