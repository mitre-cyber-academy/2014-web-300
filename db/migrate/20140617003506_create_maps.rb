class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.integer :latitude
      t.integer :longitude
      t.integer :zoom
      t.references :user, index: true

      t.timestamps
    end
  end
end
