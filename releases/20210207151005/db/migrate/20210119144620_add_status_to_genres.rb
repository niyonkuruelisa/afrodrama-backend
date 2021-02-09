class AddStatusToGenres < ActiveRecord::Migration[6.0]
  def change
    add_column :genres,:status,:boolean,default: false
  end
end
