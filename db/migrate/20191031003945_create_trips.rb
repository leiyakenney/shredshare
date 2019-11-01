class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.boolean :ride_over, default: false
      t.references :user, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.references :rtd_location, foreign_key: true
      t.integer :seats_available
      t.string :date_of_departure
      t.string :destination_point

      t.timestamps
    end
  end
end
