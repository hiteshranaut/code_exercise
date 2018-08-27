class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :car_slug, :null => false
      t.integer :max_speed, :null => false

      t.timestamps null: false
    end
    add_index :cars, :car_slug, unique: true
  end
end
