class AddColumnToMovieCovers < ActiveRecord::Migration[6.0]
  def change
    add_column :movie_covers, :cover,:string,default: ''
  end
end
