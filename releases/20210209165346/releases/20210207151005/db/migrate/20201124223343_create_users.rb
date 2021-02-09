class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false do |t|
      t.string :id, :limit => 36, :primary_key => true
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :password_digest
      t.string :phoneNumber

      t.timestamps
    end
  end
end
