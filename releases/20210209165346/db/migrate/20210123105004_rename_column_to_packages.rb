class RenameColumnToPackages < ActiveRecord::Migration[6.0]
  def change
    rename_column :packages, :type,:package_type
  end
end
