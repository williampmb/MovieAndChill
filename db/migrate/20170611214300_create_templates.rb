class CreateTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :templates do |t|
      t.integer :col
      t.integer :row
    end
  end
end
