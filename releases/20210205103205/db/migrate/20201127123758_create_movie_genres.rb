class CreateMovieGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_genres, id: false do |t|
      t.string :id, :limit => 36, :primary_key => true
      t.references :movie,null: false, type: :string
      t.references :genre,null: false, type: :string
      t.timestamps
    end
  end
end
