class CreateMovieTheaters < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_theaters do |t|
      t.references :theater, foreign_key: true
      t.references :movie, foreign_key: true
      t.timestamps
    end
  end
end
