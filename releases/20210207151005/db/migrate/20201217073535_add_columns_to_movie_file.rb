class AddColumnsToMovieFile < ActiveRecord::Migration[6.0]
  def change
    add_column :movie_files, :fileType,:string,default: ''
    add_column :movie_files, :movie,:string,default: ''
  end
end