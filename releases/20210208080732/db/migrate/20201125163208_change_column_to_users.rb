class ChangeColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users,:phoneNumber,:string,default: ''
  end
end
