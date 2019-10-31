class AddDateToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :date_of_departure, :string
  end
end
