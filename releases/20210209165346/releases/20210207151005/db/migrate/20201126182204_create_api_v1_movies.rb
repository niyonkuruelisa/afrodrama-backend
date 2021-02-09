class CreateApiV1Movies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies, id: false do |t|
      t.string :id, :limit => 36, :primary_key => true

      t.string :imdbCode, default: ''
      t.string :title, default: ''
      t.string :titleEnglish, default: ''
      t.string :titleLong, default: ''
      t.integer :movieType
      t.integer :year
      t.string :runtime, default: ''
      t.text :summary, default: ''
      t.text :description, default: ''
      t.string :ytTrailerCode, default: ''
      t.string :status, default: 'active'
      t.integer :softDelete, default: 0

      t.timestamps
    end
  end
end
