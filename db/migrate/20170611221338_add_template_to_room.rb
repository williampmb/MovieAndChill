class AddTemplateToRoom < ActiveRecord::Migration[5.0]
  def change
  	add_reference :rooms, :template, foreign_key: true
  end
end
