class AddMapRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :map, index: true
  end
end
