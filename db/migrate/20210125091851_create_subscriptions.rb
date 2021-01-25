class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions , id: false do |t|
      t.string :id, :limit => 36, :primary_key => true
      t.references :package, null: false, type: :string
      t.references :user, null: false, type: :string
      t.datetime :period_from
      t.datetime :period_to
      t.string :status,default: "active"

      t.timestamps
    end
  end
end
