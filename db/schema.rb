# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_19_070651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", id: :string, limit: 36, force: :cascade do |t|
    t.string "names"
    t.string "email"
    t.string "phone", default: ""
    t.integer "age", default: 0
    t.string "avatar", default: ""
    t.string "softDelete", default: "0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", id: :string, limit: 36, force: :cascade do |t|
    t.string "title"
    t.text "description", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "softDelete", default: false
  end

  create_table "movie_covers", id: :string, limit: 36, force: :cascade do |t|
    t.string "originalName"
    t.string "coverType"
    t.string "size"
    t.string "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cover", default: ""
    t.index ["movie_id"], name: "index_movie_covers_on_movie_id"
  end

  create_table "movie_files", id: :string, limit: 36, force: :cascade do |t|
    t.string "originalName"
    t.string "size"
    t.string "resolutions"
    t.string "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fileType", default: ""
    t.string "movie", default: ""
    t.index ["movie_id"], name: "index_movie_files_on_movie_id"
  end

  create_table "movie_genres", id: :string, limit: 36, force: :cascade do |t|
    t.string "movie_id", null: false
    t.string "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_movie_genres_on_genre_id"
    t.index ["movie_id"], name: "index_movie_genres_on_movie_id"
  end

  create_table "movies", id: :string, limit: 36, force: :cascade do |t|
    t.string "imdbCode", default: ""
    t.string "title", default: ""
    t.string "titleEnglish", default: ""
    t.string "titleLong", default: ""
    t.integer "movieType", comment: "1 = Full Movie, 2 = Short Movie, 3 = Tv Show"
    t.integer "year"
    t.string "runtime", default: ""
    t.text "summary", default: ""
    t.text "description", default: ""
    t.string "ytTrailerCode", default: ""
    t.string "status", default: "inactive"
    t.integer "softDelete", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: :string, limit: 36, force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "email"
    t.string "password_digest"
    t.string "phoneNumber", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "user"
  end

end
