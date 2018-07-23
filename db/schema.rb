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

ActiveRecord::Schema.define(version: 2018_07_23_053344) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
  end

  create_table "clients", force: :cascade do |t|
    t.integer "user_id"
    t.string "full_name"
    t.string "full_name_2"
    t.string "phone"
    t.string "phone_2"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "company_settings", force: :cascade do |t|
    t.string "primary_color"
    t.string "secondary_color"
    t.boolean "category_based"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_documents_on_project_id"
  end

  create_table "item_attributes", force: :cascade do |t|
    t.integer "item_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item_code"
    t.index ["item_id"], name: "index_item_attributes_on_item_id"
  end

  create_table "item_groups", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "brand"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_group_id"
    t.string "featured_image_file_name"
    t.string "featured_image_content_type"
    t.integer "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.decimal "cost"
    t.decimal "quote_unit_price"
    t.string "quote_unit_label"
    t.decimal "quote_total"
    t.text "quote_note"
    t.string "unit_label"
    t.string "item_code"
    t.boolean "user_uploaded"
    t.integer "user_id"
    t.string "user_item_storename"
    t.string "user_item_location"
    t.integer "project_id"
    t.integer "zone_id"
    t.integer "zone_item_group_id"
    t.integer "supplier_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["item_group_id"], name: "index_items_on_item_group_id"
    t.index ["project_id"], name: "index_items_on_project_id"
    t.index ["supplier_id"], name: "index_items_on_supplier_id"
    t.index ["user_id"], name: "index_items_on_user_id"
    t.index ["zone_id"], name: "index_items_on_zone_id"
    t.index ["zone_item_group_id"], name: "index_items_on_zone_item_group_id"
  end

  create_table "post_replies", force: :cascade do |t|
    t.text "content"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["post_id"], name: "index_post_replies_on_post_id"
    t.index ["user_id"], name: "index_post_replies_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["project_id"], name: "index_posts_on_project_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "progress_shots", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_progress_shots_on_project_id"
  end

  create_table "project_documents", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_items", force: :cascade do |t|
    t.integer "project_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_group_id"
    t.decimal "quote_unit_price"
    t.string "quote_unit_label"
    t.decimal "quote_total"
    t.text "quote_note"
    t.boolean "quote_approved"
    t.integer "category_id"
    t.boolean "discussion_raised"
    t.integer "zone_id"
    t.integer "zone_item_group_id"
    t.integer "item_attribute_id"
    t.index ["category_id"], name: "index_project_items_on_category_id"
    t.index ["item_attribute_id"], name: "index_project_items_on_item_attribute_id"
    t.index ["item_group_id"], name: "index_project_items_on_item_group_id"
    t.index ["item_id"], name: "index_project_items_on_item_id"
    t.index ["project_id"], name: "index_project_items_on_project_id"
    t.index ["zone_id"], name: "index_project_items_on_zone_id"
    t.index ["zone_item_group_id"], name: "index_project_items_on_zone_item_group_id"
  end

  create_table "project_users", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_users_on_project_id"
    t.index ["user_id"], name: "index_project_users_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "category_id"
    t.integer "client_id"
    t.string "title"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirmed"
    t.decimal "base_price"
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["client_id"], name: "index_projects_on_client_id"
  end

  create_table "quote_messages", force: :cascade do |t|
    t.text "body"
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_quote_messages_on_project_id"
    t.index ["user_id"], name: "index_quote_messages_on_user_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "postcode"
    t.string "state"
    t.string "country"
    t.string "website"
    t.string "email"
    t.string "phone"
    t.string "contact_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tips", force: :cascade do |t|
    t.text "content"
    t.integer "item_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_group_id"], name: "index_tips_on_item_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.boolean "client"
    t.boolean "master_admin"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "postcode"
    t.string "country"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.integer "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variations", force: :cascade do |t|
    t.integer "project_item_id"
    t.decimal "price"
    t.boolean "approved"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
    t.integer "item_attribute_id"
    t.index ["item_attribute_id"], name: "index_variations_on_item_attribute_id"
    t.index ["item_id"], name: "index_variations_on_item_id"
    t.index ["project_id"], name: "index_variations_on_project_id"
    t.index ["project_item_id"], name: "index_variations_on_project_item_id"
  end

  create_table "zone_item_groups", force: :cascade do |t|
    t.integer "zone_id"
    t.integer "project_id"
    t.integer "item_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_group_id"], name: "index_zone_item_groups_on_item_group_id"
    t.index ["project_id"], name: "index_zone_item_groups_on_project_id"
    t.index ["zone_id"], name: "index_zone_item_groups_on_zone_id"
  end

  create_table "zones", force: :cascade do |t|
    t.string "title"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_zones_on_project_id"
  end

end
