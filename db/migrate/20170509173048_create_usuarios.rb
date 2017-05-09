class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |u|
      u.string "nome", :limit => 50, :null => false
      u.string "email", :limit => 50, :null => false
      u.column "idade", :integer, :null => false
      u.column "acesso", :string, :default => "cliente"
      u.string "password", :null => false, :limit => 50
      u.boolean "estudante", :default => false
      u.timestamps
    end
  end
end
