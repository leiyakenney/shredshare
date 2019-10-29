class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.string :year
      t.boolean :awd
      t.boolean :storage_rack
      t.integer :total_seats
      t.string :image
      t.references :user, foreign_key: true
    end
  end
end
