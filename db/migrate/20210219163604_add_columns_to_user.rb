class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_city, :string, default: ''
    add_column :users, :user_region, :string, default: ''
    add_column :users, :user_country, :string, default: ''
    add_column :users, :user_timezone, :string, default: ''
    add_column :users, :user_location, :string, default: ''
  end
end
