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

ActiveRecord::Schema.define(version: 20180222144748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "hotels", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "time_zone"
    t.string "currency"
    t.string "subdomain"
  end

  create_table "room_service_cart_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "room_service_item_id"
    t.integer "quantity"
    t.uuid "room_service_order_id"
    t.uuid "hotel_id"
    t.index ["hotel_id"], name: "index_room_service_cart_items_on_hotel_id"
    t.index ["room_service_item_id"], name: "index_room_service_cart_items_on_room_service_item_id"
    t.index ["room_service_order_id"], name: "index_room_service_cart_items_on_room_service_order_id"
  end

  create_table "room_service_cart_items_item_choice_options", id: false, force: :cascade do |t|
    t.uuid "room_service_cart_item_id", null: false
    t.uuid "room_service_item_choice_option_id", null: false
    t.index ["room_service_cart_item_id", "room_service_item_choice_option_id"], name: "room_service_cart_items_on_item_choice_options"
    t.index ["room_service_item_choice_option_id", "room_service_cart_item_id"], name: "room_service_item_choice_options_on_cart_items"
  end

  create_table "room_service_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "available_from"
    t.time "available_until"
    t.uuid "hotel_id"
    t.index ["hotel_id"], name: "index_room_service_categories_on_hotel_id"
  end

  create_table "room_service_categories_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "room_service_category_id"
    t.uuid "room_service_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_service_category_id"], name: "index_room_service_categories_items_on_room_service_category_id"
    t.index ["room_service_item_id"], name: "index_room_service_categories_items_on_room_service_item_id"
  end

  create_table "room_service_item_choice_options", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.decimal "price"
    t.uuid "room_service_item_choice_id"
    t.uuid "hotel_id"
    t.index ["hotel_id"], name: "index_room_service_item_choice_options_on_hotel_id"
    t.index ["room_service_item_choice_id"], name: "room_service_item_choices_on_options"
  end

  create_table "room_service_item_choices", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.integer "minimum_number_of_selections"
    t.integer "maximum_number_of_selections"
    t.uuid "default_option_id"
    t.uuid "hotel_id"
    t.index ["default_option_id"], name: "index_room_service_item_choices_on_default_option_id"
    t.index ["hotel_id"], name: "index_room_service_item_choices_on_hotel_id"
  end

  create_table "room_service_item_choices_items", id: false, force: :cascade do |t|
    t.uuid "room_service_item_choice_id", null: false
    t.uuid "room_service_item_id", null: false
    t.index ["room_service_item_choice_id", "room_service_item_id"], name: "room_service_item_choices_on_items"
    t.index ["room_service_item_id", "room_service_item_choice_id"], name: "room_service_items_on_item_choices"
  end

  create_table "room_service_item_tags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.uuid "hotel_id"
    t.index ["hotel_id"], name: "index_room_service_item_tags_on_hotel_id"
  end

  create_table "room_service_item_tags_items", id: false, force: :cascade do |t|
    t.uuid "room_service_item_id", null: false
    t.uuid "room_service_item_tag_id", null: false
    t.index ["room_service_item_id", "room_service_item_tag_id"], name: "room_service_items_on_tags"
    t.index ["room_service_item_tag_id", "room_service_item_id"], name: "room_service_tags_on_items"
  end

  create_table "room_service_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
    t.text "description"
    t.string "image"
    t.string "thumbnail"
    t.uuid "hotel_id"
    t.index ["hotel_id"], name: "index_room_service_items_on_hotel_id"
  end

  create_table "room_service_orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "special_request"
    t.integer "payment_option"
    t.uuid "hotel_id"
    t.index ["hotel_id"], name: "index_room_service_orders_on_hotel_id"
  end

  add_foreign_key "room_service_cart_items", "hotels"
  add_foreign_key "room_service_cart_items", "room_service_items"
  add_foreign_key "room_service_cart_items", "room_service_orders"
  add_foreign_key "room_service_categories", "hotels"
  add_foreign_key "room_service_categories_items", "room_service_categories"
  add_foreign_key "room_service_categories_items", "room_service_items"
  add_foreign_key "room_service_item_choice_options", "hotels"
  add_foreign_key "room_service_item_choice_options", "room_service_item_choices"
  add_foreign_key "room_service_item_choices", "hotels"
  add_foreign_key "room_service_item_choices", "room_service_item_choice_options", column: "default_option_id"
  add_foreign_key "room_service_item_tags", "hotels"
  add_foreign_key "room_service_items", "hotels"
  add_foreign_key "room_service_orders", "hotels"
end
