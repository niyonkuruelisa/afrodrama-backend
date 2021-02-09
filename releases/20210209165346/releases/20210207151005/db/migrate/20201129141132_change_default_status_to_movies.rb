class ChangeDefaultStatusToMovies < ActiveRecord::Migration[6.0]
  def change
    change_column :movies,:status,:string,default: 'inactive'
  end
end