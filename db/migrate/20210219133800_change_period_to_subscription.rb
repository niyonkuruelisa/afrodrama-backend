class ChangePeriodToSubscription < ActiveRecord::Migration[6.0]
  def change
    change_column :subscriptions, :period_from, :datetime, precision: 6, null: false
    change_column :subscriptions, :period_to, :datetime, precision: 6, null: false
  end
end
