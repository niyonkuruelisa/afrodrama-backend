class ChangeCamelcaseToUnderscore < ActiveRecord::Migration[6.0]
  def change
    rename_column :movie_covers,:coverType,:cover_type
    rename_column :movie_covers,:originalName,:original_name
    rename_column :movie_files,:originalName,:original_name
    rename_column :movie_files,:fileType,:file_type
    rename_column :movies,:titleEnglish,:title_english
    rename_column :movies,:titleLong,:title_long
    rename_column :movies,:ytTrailerCode,:yt_trailer_code
    rename_column :movies,:softDelete,:soft_delete
    rename_column :users,:firstName,:first_name
    rename_column :users,:lastName,:last_name
    rename_column :users,:phoneNumber,:phone_number
  end
end
