class AddTitCenStrToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :title, :string, :limit =>20
    add_column :movies, :censorship, :integer, :default => 0
    add_column :movies, :storyline, :string, :limit => 100
  end
end
