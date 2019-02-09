# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190209195130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "img_url"
    t.date     "date_of_birth"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "actors_movies", id: false, force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "actor_id", null: false
    t.index ["actor_id", "movie_id"], name: "index_actors_movies_on_actor_id_and_movie_id", using: :btree
    t.index ["movie_id", "actor_id"], name: "index_actors_movies_on_movie_id_and_actor_id", using: :btree
  end

  create_table "directors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "img_url"
    t.date     "date_of_birth"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "directors_movies", id: false, force: :cascade do |t|
    t.integer "movie_id",    null: false
    t.integer "director_id", null: false
    t.index ["director_id", "movie_id"], name: "index_directors_movies_on_director_id_and_movie_id", using: :btree
    t.index ["movie_id", "director_id"], name: "index_directors_movies_on_movie_id_and_director_id", using: :btree
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "genre_id", null: false
    t.index ["genre_id", "movie_id"], name: "index_genres_movies_on_genre_id_and_movie_id", using: :btree
    t.index ["movie_id", "genre_id"], name: "index_genres_movies_on_movie_id_and_genre_id", using: :btree
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.date     "release_date"
    t.text     "description"
    t.integer  "running_time_minutes"
    t.string   "thumb_url"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "rating"
    t.string   "short_description"
    t.string   "language"
    t.string   "api_id"
  end

  create_table "showtimes", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "theater_id"
    t.date     "screening_date"
    t.time     "screening_time"
    t.string   "ticket_link"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["movie_id"], name: "index_showtimes_on_movie_id", using: :btree
    t.index ["theater_id"], name: "index_showtimes_on_theater_id", using: :btree
  end

  create_table "theaters", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone_number"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
