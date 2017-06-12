class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|

      t.timestamps
      t.integer :chair
    end
  end
end
