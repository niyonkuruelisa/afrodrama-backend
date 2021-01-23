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

ActiveRecord::Schema.define(version: 2021_01_23_105512) do

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
    t.boolean "soft_delete", default: false
    t.boolean "status", default: false
  end

  create_table "movie_covers", id: :string, limit: 36, force: :cascade do |t|
    t.string "original_name"
    t.string "cover_type"
    t.string "size"
    t.string "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cover", default: ""
    t.index ["movie_id"], name: "index_movie_covers_on_movie_id"
  end

  create_table "movie_files", id: :string, limit: 36, force: :cascade do |t|
    t.string "original_name"
    t.string "size"
    t.string "resolutions"
    t.string "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "file_type", default: ""
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
    t.string "imd_code", default: ""
    t.string "title", default: ""
    t.string "title_english", default: ""
    t.string "title_long", default: ""
    t.integer "movie_type", comment: "1 = Full Movie, 2 = Short Movie, 3 = Tv Show"
    t.integer "year"
    t.string "runtime", default: ""
    t.text "summary", default: ""
    t.text "description", default: ""
    t.string "yt_trailer_code", default: ""
    t.string "status", default: "inactive"
    t.integer "soft_delete", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "packages", id: :string, limit: 36, force: :cascade do |t|
    t.string "package_type"
    t.integer "amount"
    t.string "status", default: "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "discount", default: 0
    t.string "name"
  end

  create_table "systems", id: :string, limit: 36, force: :cascade do |t|
    t.string "title"
    t.string "company_name"
    t.text "about"
    t.string "slogan"
    t.string "email"
    t.string "phone1"
    t.string "phone2"
    t.text "keywords"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: :string, limit: 36, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "phone_number", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "user"
  end

end
