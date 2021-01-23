class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages, id: false do |t|
      t.string :id, :limit => 36, :primary_key => true
      t.string :type
      t.integer :amount
      t.string :status

      t.timestamps
    end
  end
end
