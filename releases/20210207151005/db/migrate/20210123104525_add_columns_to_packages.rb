class AddColumnsToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages,:discount,:integer, :default => 0
    add_column :packages,:name,:string
  end
end
