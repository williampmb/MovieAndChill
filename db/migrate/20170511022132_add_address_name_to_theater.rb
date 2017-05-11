class AddAddressNameToTheater < ActiveRecord::Migration[5.0]
  def change
    add_column :theaters, :address, :string, :limit => 50
    add_column :theaters, :name, :string, :limit => 30, :null => false
  end
end
