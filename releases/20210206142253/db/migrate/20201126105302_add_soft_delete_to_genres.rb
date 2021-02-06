class AddSoftDeleteToGenres < ActiveRecord::Migration[6.0]
  def change
    add_column :genres ,:softDelete,:boolean,default: 0
  end
end
