class CreateApiV1Characters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters, id: false do |t|
      t.string :id, :limit => 36, :primary_key => true
      t.string  :names
      t.string  :email
      t.string  :phone,default: ''
      t.integer :age,default: 0
      t.string  :avatar,default: ''
      t.string  :softDelete,default: 0
      t.timestamps
    end
  end
end
