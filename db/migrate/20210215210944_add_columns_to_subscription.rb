class AddColumnsToSubscription < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions,:statusDescription,:string,default: ''
    add_column :subscriptions,:spTransactionId,:string,default: ''
    add_column :subscriptions,:walletTransactionId,:string,default: ''
    add_column :subscriptions,:chargedCommission,:string,default: ''
    add_column :subscriptions,:currency,:string,default: ''
    add_column :subscriptions,:paidAmount,:integer,default: 0
    add_column :subscriptions,:transactionId,:string,default: ''
    add_column :subscriptions,:transactionStatus,:string,default: ''

  end
end
