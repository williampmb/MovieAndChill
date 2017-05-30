class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |p|
      p.string "payment", :limit =>20, :default => "debit"
      p.integer "installment_times", :default => 0
      p.float "total", :default => 0
      p.timestamps
	  p.references :user, foreign_key: true
    end
  end
end