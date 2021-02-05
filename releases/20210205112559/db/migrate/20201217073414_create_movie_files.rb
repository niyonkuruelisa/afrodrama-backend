class CreateMovieFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_files, id: false do |t|
      t.string :id, :limit => 36, :primary_key => true
      t.string :originalName
      t.string :size
      t.string :resolutions
      t.references :movie, null: false, type: :string

      t.timestamps
    end
  end
end
