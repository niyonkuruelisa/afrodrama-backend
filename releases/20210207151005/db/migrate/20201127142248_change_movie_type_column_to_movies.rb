class ChangeMovieTypeColumnToMovies < ActiveRecord::Migration[6.0]
  def change
    change_column :movies,:movieType,:integer,comment: '1 = Full Movie, 2 = Short Movie, 3 = Tv Show'
  end
end
