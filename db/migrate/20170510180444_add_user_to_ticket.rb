class AddUserToTicket < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :user, foreign_key: true
  end
end
