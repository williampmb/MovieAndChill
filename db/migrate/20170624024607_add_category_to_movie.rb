class AddCategoryToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :category, :string, :limit => 15
  end
end
