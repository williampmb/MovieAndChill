class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
		t.boolean :status
		t.float :price, :default =>0
		t.references :purchase, foreign_key: true
		t.timestamps
    end
  end
end
