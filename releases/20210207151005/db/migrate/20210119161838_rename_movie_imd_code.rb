class RenameMovieImdCode < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies,:imdbCode,:imd_code
  end
end
