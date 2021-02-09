class CreateSystems < ActiveRecord::Migration[6.0]
  def change
    create_table :systems, id: false do |t|
      t.string :id, :limit => 36, :primary_key => true
      t.string :title
      t.string :company_name
      t.text :about
      t.string :slogan
      t.string :email
      t.string :phone1
      t.string :phone2
      t.text :keywords
      t.text :address

      t.timestamps
    end
  end
end
