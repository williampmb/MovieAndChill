class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.references :movie, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
