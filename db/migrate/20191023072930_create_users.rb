class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.string :picture
      t.string :pass
      t.string :bio
      t.string :sport_type
      t.string :role
    end
  end
end
