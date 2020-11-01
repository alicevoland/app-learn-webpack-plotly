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

ActiveRecord::Schema.define(version: 2020_11_01_173606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coachings", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "coach_id"
    t.bigint "student_id"
    t.index ["coach_id"], name: "index_coachings_on_coach_id"
    t.index ["student_id"], name: "index_coachings_on_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wheel_models", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "labels", default: [], array: true
    t.integer "maximum"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wheel_values", force: :cascade do |t|
    t.bigint "wheel_model_id"
    t.bigint "user_id"
    t.integer "current_values", default: [], array: true
    t.integer "goal_values", default: [], array: true
    t.string "comments", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wheel_values_on_user_id"
    t.index ["wheel_model_id"], name: "index_wheel_values_on_wheel_model_id"
  end

  add_foreign_key "coachings", "users", column: "coach_id"
  add_foreign_key "coachings", "users", column: "student_id"
end
