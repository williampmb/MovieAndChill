class AddReservationToTicket < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :reservations, foreign_key: true
  end
end
