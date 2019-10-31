class CreateRtdLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :rtd_locations do |t|
      t.string :area
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :place_id
    end
  end
end
