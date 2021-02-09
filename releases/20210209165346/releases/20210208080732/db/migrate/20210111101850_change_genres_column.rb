class ChangeGenresColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :genres,:softDelete,:soft_delete
  end
end
