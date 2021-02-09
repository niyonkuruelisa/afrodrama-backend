class AddDefaultToColumnsToPackages < ActiveRecord::Migration[6.0]
  def change
    change_column :packages, :status,:string,:default => "active"
  end
end
