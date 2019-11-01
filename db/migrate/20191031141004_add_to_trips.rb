class AddToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :day_of_trip, :string
    add_column :trips, :month_of_trip, :string
    add_column :trips, :year_of_trip, :string
    add_column :trips, :ride_type, :string
  end
end
