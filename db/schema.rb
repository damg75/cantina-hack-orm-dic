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

ActiveRecord::Schema.define(version: 2019_12_20_213144) do

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
  end

  create_table "clients", force: :cascade do |t|
    t.string "client_name"
    t.string "client_last_name"
    t.string "client_rif"
    t.string "client_address"
    t.string "client_email"
    t.string "client_phone"
    t.decimal "client_balance"
  end

  create_table "invoices", force: :cascade do |t|
    t.date "invoice_date"
    t.integer "client_id"
    t.index ["client_id"], name: "index_invoices_on_client_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.string "product_description"
    t.integer "product_quantity"
    t.decimal "selling_price"
    t.integer "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "sale_quantity"
    t.decimal "sale_price"
    t.integer "invoice_id"
    t.integer "product_id"
    t.index ["invoice_id"], name: "index_sales_on_invoice_id"
    t.index ["product_id"], name: "index_sales_on_product_id"
  end

end
