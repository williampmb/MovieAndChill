class AddCapacityToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :capacity, :integer, :default => 0
  end
end
