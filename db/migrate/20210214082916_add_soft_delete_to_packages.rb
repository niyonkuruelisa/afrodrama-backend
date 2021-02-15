class AddSoftDeleteToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages ,:softDelete,:boolean,default: 0
  end
end
