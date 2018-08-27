class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.string :surface_type, null: false
      t.string :time_zone, null: false

      t.timestamps null: false
    end
    add_index :tracks, :name, unique: true
  end
end
