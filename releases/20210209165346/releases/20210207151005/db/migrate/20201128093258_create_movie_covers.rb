class CreateMovieCovers < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_covers, id: false do |t|
      t.string :id, :limit => 36, :primary_key => true
      t.string :originalName
      t.string :type
      t.string :size
      t.references :movie, null: false, type: :string

      t.timestamps
    end
  end
end
