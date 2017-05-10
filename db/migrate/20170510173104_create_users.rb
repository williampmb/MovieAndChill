class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |u|
		u.string "name", :limit => 50, :null => false
		u.string "email", :limit => 50, :null => false
		u.column "age", :integer, :null => false
		u.column "role", :string, :default => "customer"
		u.string "password", :null => false, :limit => 50
		u.boolean "student", :default => false
		u.timestamps
    end
  end
end
