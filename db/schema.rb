# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130712214956) do

  create_table "address_types", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.integer  "created_by",  :null => false
    t.integer  "updated_by",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "addresses", :force => true do |t|
    t.string   "street",     :null => false
    t.string   "suite"
    t.string   "city",       :null => false
    t.string   "state",      :null => false
    t.string   "zip",        :null => false
    t.integer  "updated_by", :null => false
    t.integer  "created_by", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "addresses", ["id"], :name => "index_addresses_on_id", :unique => true
  add_index "addresses", ["street"], :name => "index_addresses_on_street"

  create_table "customer_addresses", :force => true do |t|
    t.integer  "customer_id",     :null => false
    t.integer  "address_type_id", :null => false
    t.string   "name"
    t.string   "line_one",        :null => false
    t.string   "line_two"
    t.string   "suite"
    t.string   "city",            :null => false
    t.string   "state",           :null => false
    t.string   "zip",             :null => false
    t.integer  "updated_by",      :null => false
    t.integer  "created_by",      :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "firstname",   :null => false
    t.string   "lastname",    :null => false
    t.string   "email",       :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "created_by",  :null => false
    t.integer  "updated_by",  :null => false
  end

  add_index "customers", ["id"], :name => "index_customers_on_id", :unique => true

  create_table "email_types", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.integer  "updated_by",  :null => false
    t.integer  "created_by",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "emails", :force => true do |t|
    t.string   "content",       :null => false
    t.integer  "email_type_id", :null => false
    t.integer  "updated_by"
    t.integer  "created_by"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "fabric_prices", :force => true do |t|
    t.integer  "amount",     :null => false
    t.date     "date",       :null => false
    t.integer  "updated_by", :null => false
    t.integer  "created_by", :null => false
    t.integer  "fabric_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fabrics", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "created_by", :null => false
    t.integer  "updated_by", :null => false
  end

  add_index "fabrics", ["id"], :name => "index_fabrics_on_id", :unique => true
  add_index "fabrics", ["name"], :name => "index_fabrics_on_name"

  create_table "farms", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "address_id", :null => false
    t.integer  "created_by", :null => false
    t.integer  "updated_by", :null => false
    t.string   "contact"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "farms", ["id"], :name => "index_farms_on_id", :unique => true
  add_index "farms", ["name"], :name => "index_farms_on_name"

  create_table "notes", :force => true do |t|
    t.string   "notable_type", :null => false
    t.integer  "notable_id",   :null => false
    t.string   "type",         :null => false
    t.string   "content",      :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "created_by",   :null => false
    t.integer  "updated_by",   :null => false
  end

  add_index "notes", ["id"], :name => "index_notes_on_id", :unique => true

  create_table "order_line_items", :force => true do |t|
    t.integer  "quantity",   :default => 1, :null => false
    t.integer  "price",                     :null => false
    t.integer  "subtotal",                  :null => false
    t.integer  "order_id",                  :null => false
    t.integer  "product_id",                :null => false
    t.integer  "updated_by",                :null => false
    t.integer  "created_by",                :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "order_line_items", ["id"], :name => "index_order_line_items_on_id", :unique => true

  create_table "order_statuses", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "updated_by"
    t.integer  "created_by"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "orders", :force => true do |t|
    t.date     "purchase_date",                      :null => false
    t.date     "paid_date"
    t.integer  "customer_id",                        :null => false
    t.integer  "purchase_amount",                    :null => false
    t.integer  "paid_amount",     :default => 0,     :null => false
    t.integer  "updated_by",                         :null => false
    t.integer  "created_by",                         :null => false
    t.boolean  "ispaid",          :default => false, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "order_status_id",                    :null => false
  end

  add_index "orders", ["id"], :name => "index_orders_on_id", :unique => true

  create_table "products", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description", :null => false
    t.integer  "price",       :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "created_by",  :null => false
    t.integer  "updated_by",  :null => false
    t.integer  "count",       :null => false
  end

  add_index "products", ["id"], :name => "index_products_on_id", :unique => true
  add_index "products", ["name"], :name => "index_products_on_name"

  create_table "retailers", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "address_id", :null => false
    t.string   "phone"
    t.string   "contact"
    t.integer  "updated_by", :null => false
    t.integer  "created_by", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "retailers", ["id"], :name => "index_retailers_on_id", :unique => true
  add_index "retailers", ["name"], :name => "index_retailers_on_name"

  create_table "roles", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "roles", ["id"], :name => "index_roles_on_id", :unique => true
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sewings", :force => true do |t|
    t.integer  "fabric_id",  :null => false
    t.integer  "product_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "created_by", :null => false
    t.integer  "updated_by", :null => false
  end

  add_index "sewings", ["fabric_id"], :name => "index_sewings_on_fabric_id"
  add_index "sewings", ["product_id"], :name => "index_sewings_on_product_id"

  create_table "task_status_types", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description", :null => false
    t.integer  "created_by",  :null => false
    t.integer  "updated_by",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "title",          :null => false
    t.text     "description"
    t.integer  "updated_by",     :null => false
    t.integer  "created_by",     :null => false
    t.date     "due_date"
    t.date     "completed_on"
    t.integer  "completed_by"
    t.integer  "assigned_to"
    t.integer  "task_status_id", :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                            :null => false
    t.string   "email",                               :null => false
    t.boolean  "active",            :default => true, :null => false
    t.integer  "role_id",                             :null => false
    t.string   "crypted_password",                    :null => false
    t.string   "password_salt",                       :null => false
    t.string   "persistence_token",                   :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "users", ["id"], :name => "index_users_on_id", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username"

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
