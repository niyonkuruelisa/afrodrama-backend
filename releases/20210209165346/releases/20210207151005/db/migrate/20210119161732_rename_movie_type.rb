class RenameMovieType < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies,:movieType,:movie_type
  end
end
