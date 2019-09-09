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

ActiveRecord::Schema.define(version: 20190907054715) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "postalcode"
    t.integer  "prefecture"
    t.string   "municipalities"
    t.string   "address"
    t.string   "buildingname"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     null: false
    t.string   "customer_id", null: false
    t.string   "card_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
    t.index ["name"], name: "index_categories_on_name", using: :btree
  end

  create_table "commodity_conditions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "condition",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "condition",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days_before_shipments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "days",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_methods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "prefecture_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "image",      limit: 65535, null: false
    t.integer  "product_id",               null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["product_id"], name: "index_pictures_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                  null: false
    t.text     "explain",                 limit: 65535, null: false
    t.integer  "prefecture_id",                         null: false
    t.integer  "price",                                 null: false
    t.integer  "category_id"
    t.integer  "size_id"
    t.integer  "brand_id"
    t.integer  "commodity_condition_id"
    t.integer  "shipping_charge_id"
    t.integer  "delivery_method_id"
    t.integer  "days_before_shipment_id"
    t.integer  "user_id"
    t.integer  "condition_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["brand_id"], name: "index_products_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["commodity_condition_id"], name: "index_products_on_commodity_condition_id", using: :btree
    t.index ["condition_id"], name: "index_products_on_condition_id", using: :btree
    t.index ["days_before_shipment_id"], name: "index_products_on_days_before_shipment_id", using: :btree
    t.index ["delivery_method_id"], name: "index_products_on_delivery_method_id", using: :btree
    t.index ["name"], name: "index_products_on_name", using: :btree
    t.index ["shipping_charge_id"], name: "index_products_on_shipping_charge_id", using: :btree
    t.index ["size_id"], name: "index_products_on_size_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "shipping_charges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "method",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "size",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["size"], name: "index_sizes_on_size", using: :btree
  end

  create_table "sns_credentials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "uid"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sns_credentials_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "family_name_kanji",                                 null: false
    t.string   "first_name_kanji",                                  null: false
    t.string   "family_name_cana",                                  null: false
    t.string   "first_name_cana",                                   null: false
    t.integer  "year",                                              null: false
    t.integer  "month",                                             null: false
    t.integer  "day",                                               null: false
    t.text     "image",                  limit: 65535
    t.string   "nickname",                                          null: false
    t.text     "explain",                limit: 65535
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_users_products_on_product_id", using: :btree
    t.index ["user_id"], name: "index_users_products_on_user_id", using: :btree
  end

  add_foreign_key "cards", "users"
  add_foreign_key "pictures", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "commodity_conditions"
  add_foreign_key "products", "conditions"
  add_foreign_key "products", "days_before_shipments"
  add_foreign_key "products", "delivery_methods"
  add_foreign_key "products", "shipping_charges"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "users"
  add_foreign_key "users_products", "products"
  add_foreign_key "users_products", "users"
end
