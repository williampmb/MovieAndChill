class AddReservationToTickets < ActiveRecord::Migration[5.0]
  def change
  	add_column :tickets, :chair, :string, :limit => 10
  end
end
