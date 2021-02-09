class ChangeColumnToMovieCovers < ActiveRecord::Migration[6.0]
  def change
    rename_column :movie_covers,:type,:coverType
  end
end
