class AddSessionToTicket < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :session, foreign_key: true
  end
end
