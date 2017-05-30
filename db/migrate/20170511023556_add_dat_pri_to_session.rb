class AddDatPriToSession < ActiveRecord::Migration[5.0]
  def change
    add_column :sessions, :date, :datetime, :null => false
    add_column :sessions, :price, :float, :default => 0
  end
end
