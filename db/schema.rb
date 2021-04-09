# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_09_080302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.integer "room_id"
    t.string "name"
    t.string "description"
    t.boolean "is_available", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_amenities_on_room_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "hotel_id"
    t.integer "customer_id"
    t.integer "room_id"
    t.integer "room_rate_id"
    t.datetime "arrival_date"
    t.datetime "departure_date"
    t.datetime "booked_check_in"
    t.datetime "booked_check_out"
    t.integer "no_of_rooms"
    t.integer "no_of_adults"
    t.integer "no_of_child", default: 0
    t.integer "reservation_type"
    t.integer "book_status"
    t.string "booking_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["hotel_id"], name: "index_bookings_on_hotel_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
    t.index ["room_rate_id"], name: "index_bookings_on_room_rate_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "title"
    t.string "phone"
    t.date "dob"
    t.string "gender"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "booking_id"
    t.float "total_amt"
    t.float "deposit_amt"
    t.string "card_number"
    t.date "card_exp_date"
    t.string "invoice_id"
    t.integer "type"
    t.integer "pay_status"
    t.string "billing_name"
    t.string "billing_street"
    t.string "billing_country"
    t.string "billing_state"
    t.string "billing_city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_payments_on_booking_id"
  end

  create_table "room_rates", force: :cascade do |t|
    t.integer "room_id"
    t.integer "rate_type"
    t.float "min_price", default: 0.0
    t.float "max_price", default: 0.0
    t.boolean "is_active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_room_rates_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "hotel_id"
    t.string "name"
    t.string "description"
    t.integer "room_type"
    t.integer "room_class"
    t.integer "total_quantity", default: 0
    t.integer "total_booked", default: 0
    t.integer "capacity", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

end
