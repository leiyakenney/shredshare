class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.references :user, foreign_key: true
      t.boolean :awd
      t.boolean :storage_rack
      t.integer :total_number_seats
    end
  end
end
