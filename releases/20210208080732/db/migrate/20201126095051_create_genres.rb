class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres, id: false do |t|
      t.string :id, :limit => 36, :primary_key => true
      t.string :title
      t.text :description,default: ''
      t.timestamps
    end
  end
end
