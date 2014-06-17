class AddDefaultsToMap < ActiveRecord::Migration
  def change
    change_column :maps, :latitude, :integer, default: 0
    change_column :maps, :longitude, :integer, default: 0
    change_column :maps, :zoom, :integer, default: 0
  end
end
