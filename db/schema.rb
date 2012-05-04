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

ActiveRecord::Schema.define(:version => 20120504184826) do

  create_table "addresses", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zipcode"
    t.integer  "country_id"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state_name"
    t.string   "alternative_phone"
    t.boolean  "pickup"
  end

  add_index "addresses", ["firstname"], :name => "index_addresses_on_firstname"
  add_index "addresses", ["lastname"], :name => "index_addresses_on_lastname"

  create_table "adjustments", :force => true do |t|
    t.integer  "order_id"
    t.decimal  "amount",          :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
    t.string   "source_type"
    t.boolean  "mandatory"
    t.boolean  "locked"
    t.integer  "originator_id"
    t.string   "originator_type"
  end

  add_index "adjustments", ["order_id"], :name => "index_adjustments_on_order_id"

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_id"
    t.boolean  "featured"
    t.boolean  "published"
    t.integer  "city_id"
    t.string   "subtitle"
    t.string   "slug"
  end

  create_table "articles_taxons", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "taxon_id"
  end

  add_index "articles_taxons", ["article_id"], :name => "index_articles_taxons_on_article_id"
  add_index "articles_taxons", ["taxon_id"], :name => "index_articles_taxons_on_taxon_id"

  create_table "assets", :force => true do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type",           :limit => 50
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.integer  "attachment_size"
    t.integer  "position"
    t.string   "type",                    :limit => 75
    t.datetime "attachment_updated_at"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.text     "alt"
    t.boolean  "logo"
    t.boolean  "featured"
  end

  add_index "assets", ["viewable_id"], :name => "index_assets_on_viewable_id"
  add_index "assets", ["viewable_type", "type"], :name => "index_assets_on_viewable_type_and_type"

  create_table "calculators", :force => true do |t|
    t.string   "type"
    t.integer  "calculable_id",   :null => false
    t.string   "calculable_type", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "comments", :force => true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.integer  "product_id"
    t.text     "text"
    t.string   "title"
    t.boolean  "hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "review"
    t.integer  "rating"
    t.integer  "recipe_id"
  end

  create_table "configurations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",       :limit => 50
  end

  add_index "configurations", ["name", "type"], :name => "index_configurations_on_name_and_type"

  create_table "countries", :force => true do |t|
    t.string  "iso_name"
    t.string  "iso"
    t.string  "name"
    t.string  "iso3"
    t.integer "numcode"
  end

  create_table "creditcards", :force => true do |t|
    t.string   "month"
    t.string   "year"
    t.string   "cc_type"
    t.string   "last_digits"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "start_month"
    t.string   "start_year"
    t.string   "issue_number"
    t.integer  "address_id"
    t.string   "gateway_customer_profile_id"
    t.string   "gateway_payment_profile_id"
  end

  create_table "deliveries", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "order_id"
    t.boolean  "pick_up"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pickup_id"
    t.integer  "shipping_method_id"
  end

  create_table "gateways", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.string   "environment", :default => "development"
    t.string   "server",      :default => "test"
    t.boolean  "test_mode",   :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hours", :force => true do |t|
    t.string   "monday"
    t.string   "tuesday"
    t.string   "wednesday"
    t.string   "thursday"
    t.string   "friday"
    t.string   "saturday"
    t.string   "sunday"
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pickup_location_id"
  end

  create_table "inventory_units", :force => true do |t|
    t.integer  "variant_id"
    t.integer  "order_id"
    t.string   "state"
    t.integer  "lock_version",            :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shipment_id"
    t.integer  "return_authorization_id"
  end

  add_index "inventory_units", ["order_id"], :name => "index_inventory_units_on_order_id"
  add_index "inventory_units", ["shipment_id"], :name => "index_inventory_units_on_shipment_id"
  add_index "inventory_units", ["variant_id"], :name => "index_inventory_units_on_variant_id"

  create_table "items", :force => true do |t|
    t.integer  "product_id"
    t.string   "delivery_type"
    t.integer  "pickup_id"
    t.integer  "quantity"
    t.integer  "supplier_invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "line_item_id"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "variant_id"
    t.integer  "quantity",                                 :null => false
    t.decimal  "price",      :precision => 8, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["order_id"], :name => "index_line_items_on_order_id"
  add_index "line_items", ["variant_id"], :name => "index_line_items_on_variant_id"

  create_table "log_entries", :force => true do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail_methods", :force => true do |t|
    t.string   "environment"
    t.boolean  "active",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "supplier_id"
    t.string   "title"
    t.string   "text"
    t.integer  "user_id"
    t.boolean  "opened"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "option_types", :force => true do |t|
    t.string   "name",         :limit => 100
    t.string   "presentation", :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",                    :default => 0, :null => false
  end

  create_table "option_types_prototypes", :id => false, :force => true do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
  end

  create_table "option_values", :force => true do |t|
    t.integer  "option_type_id"
    t.string   "name"
    t.integer  "position"
    t.string   "presentation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "option_values_variants", :id => false, :force => true do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
  end

  add_index "option_values_variants", ["variant_id", "option_value_id"], :name => "index_option_values_variants_on_variant_id_and_option_value_id"
  add_index "option_values_variants", ["variant_id"], :name => "index_option_values_variants_on_variant_id"

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.string   "number",               :limit => 15
    t.decimal  "item_total",                         :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total",                              :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.decimal  "adjustment_total",                   :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "credit_total",                       :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "completed_at"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.decimal  "payment_total",                      :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "shipping_method_id"
    t.string   "shipment_state"
    t.string   "payment_state"
    t.string   "email"
    t.text     "special_instructions"
  end

  add_index "orders", ["number"], :name => "index_orders_on_number"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "permalink"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_methods", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.string   "environment", :default => "development"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "display_on"
  end

  create_table "payments", :force => true do |t|
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",            :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "payment_method_id"
    t.string   "state"
    t.string   "response_code"
    t.string   "avs_response"
  end

  create_table "pickup_dates", :force => true do |t|
    t.datetime "day"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pickup_id"
  end

  create_table "pickup_locations", :force => true do |t|
    t.string   "location_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zipcode"
    t.integer  "country_id"
    t.integer  "supplier_id"
    t.boolean  "featured"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pickups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pickup_location_id"
    t.integer  "supplier_id"
    t.integer  "delivery_id"
  end

  create_table "preferences", :force => true do |t|
    t.string   "name",       :limit => 100, :null => false
    t.integer  "owner_id",                  :null => false
    t.string   "owner_type", :limit => 50,  :null => false
    t.integer  "group_id"
    t.string   "group_type", :limit => 50
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "preferences", ["owner_id", "owner_type", "name", "group_id", "group_type"], :name => "ix_prefs_on_owner_attr_pref", :unique => true

  create_table "product_groups", :force => true do |t|
    t.string "name"
    t.string "permalink"
    t.string "order"
  end

  add_index "product_groups", ["name"], :name => "index_product_groups_on_name"
  add_index "product_groups", ["permalink"], :name => "index_product_groups_on_permalink"

  create_table "product_groups_products", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "product_group_id"
  end

  create_table "product_option_types", :force => true do |t|
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_properties", :force => true do |t|
    t.integer  "product_id"
    t.integer  "property_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_properties", ["product_id"], :name => "index_product_properties_on_product_id"

  create_table "product_scopes", :force => true do |t|
    t.integer "product_group_id"
    t.string  "name"
    t.text    "arguments"
  end

  add_index "product_scopes", ["name"], :name => "index_product_scopes_on_name"
  add_index "product_scopes", ["product_group_id"], :name => "index_product_scopes_on_product_group_id"

  create_table "products", :force => true do |t|
    t.string   "name",                                                :default => "", :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
    t.datetime "available_on"
    t.integer  "tax_category_id"
    t.integer  "shipping_category_id"
    t.datetime "deleted_at"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "count_on_hand",                                       :default => 0,  :null => false
    t.integer  "supplier_id"
    t.boolean  "featured"
    t.integer  "start"
    t.integer  "end"
    t.boolean  "seasonal"
    t.decimal  "number_of_units",      :precision => 10, :scale => 0
    t.string   "unit"
    t.boolean  "shipping"
    t.decimal  "cost_per_unit",        :precision => 10, :scale => 0
    t.integer  "shipping_method_id"
    t.boolean  "pickup"
    t.integer  "pickup_id"
    t.boolean  "specialty"
  end

  add_index "products", ["available_on"], :name => "index_products_on_available_on"
  add_index "products", ["deleted_at"], :name => "index_products_on_deleted_at"
  add_index "products", ["name"], :name => "index_products_on_name"
  add_index "products", ["permalink"], :name => "index_products_on_permalink"

  create_table "products_promotion_rules", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "promotion_rule_id"
  end

  add_index "products_promotion_rules", ["product_id"], :name => "index_products_promotion_rules_on_product_id"
  add_index "products_promotion_rules", ["promotion_rule_id"], :name => "index_products_promotion_rules_on_promotion_rule_id"

  create_table "products_taxons", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "taxon_id"
  end

  add_index "products_taxons", ["product_id"], :name => "index_products_taxons_on_product_id"
  add_index "products_taxons", ["taxon_id"], :name => "index_products_taxons_on_taxon_id"

  create_table "promotion_rules", :force => true do |t|
    t.integer  "promotion_id"
    t.integer  "user_id"
    t.integer  "product_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "promotion_rules", ["product_group_id"], :name => "index_promotion_rules_on_product_group_id"
  add_index "promotion_rules", ["user_id"], :name => "index_promotion_rules_on_user_id"

  create_table "promotion_rules_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "promotion_rule_id"
  end

  add_index "promotion_rules_users", ["promotion_rule_id"], :name => "index_promotion_rules_users_on_promotion_rule_id"
  add_index "promotion_rules_users", ["user_id"], :name => "index_promotion_rules_users_on_user_id"

  create_table "promotions", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.integer  "usage_limit"
    t.boolean  "combine"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "starts_at"
    t.string   "match_policy", :default => "all"
    t.string   "name"
  end

  create_table "properties", :force => true do |t|
    t.string   "name"
    t.string   "presentation", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties_prototypes", :id => false, :force => true do |t|
    t.integer "prototype_id"
    t.integer "property_id"
  end

  create_table "prototypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "value"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "comment_id"
  end

  create_table "recipes", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "text"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.boolean  "featured"
    t.string   "author"
    t.string   "website"
  end

  create_table "return_authorizations", :force => true do |t|
    t.string   "number"
    t.decimal  "amount",     :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "order_id"
    t.text     "reason"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "shipments", :force => true do |t|
    t.integer  "order_id"
    t.integer  "shipping_method_id"
    t.string   "tracking"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
    t.decimal  "cost",               :precision => 8, :scale => 2
    t.datetime "shipped_at"
    t.integer  "address_id"
    t.string   "state"
  end

  add_index "shipments", ["number"], :name => "index_shipments_on_number"

  create_table "shipping_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_methods", :force => true do |t|
    t.integer  "zone_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_on"
  end

  create_table "shipping_methods_suppliers", :id => false, :force => true do |t|
    t.integer "supplier_id"
    t.integer "shipping_method_id"
  end

  add_index "shipping_methods_suppliers", ["shipping_method_id"], :name => "index_shipping_methods_suppliers_on_shipping_method_id"
  add_index "shipping_methods_suppliers", ["supplier_id"], :name => "index_shipping_methods_suppliers_on_supplier_id"

  create_table "state_events", :force => true do |t|
    t.integer  "stateful_id"
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "previous_state"
    t.string   "stateful_type"
    t.string   "next_state"
  end

  create_table "states", :force => true do |t|
    t.string  "name"
    t.string  "abbr"
    t.integer "country_id"
  end

  create_table "supplier_invoices", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_count"
    t.decimal  "invoice_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_id"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "town"
    t.string   "state_id"
    t.string   "zip_code"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "website"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.boolean  "featured"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "title"
    t.string   "description2"
    t.integer  "user_id"
    t.string   "slug"
    t.text     "products_sold"
  end

  create_table "suppliers_taxons", :id => false, :force => true do |t|
    t.integer "supplier_id"
    t.integer "taxon_id"
  end

  add_index "suppliers_taxons", ["supplier_id"], :name => "index_suppliers_taxons_on_supplier_id"
  add_index "suppliers_taxons", ["taxon_id"], :name => "index_suppliers_taxons_on_taxon_id"

  create_table "tax_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_default",  :default => false
  end

  create_table "tax_rates", :force => true do |t|
    t.integer  "zone_id"
    t.decimal  "amount",          :precision => 8, :scale => 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tax_category_id"
  end

  create_table "taxonomies", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxons", :force => true do |t|
    t.integer  "taxonomy_id",                      :null => false
    t.integer  "parent_id"
    t.integer  "position",          :default => 0
    t.string   "name",                             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.text     "description"
  end

  add_index "taxons", ["parent_id"], :name => "index_taxons_on_parent_id"
  add_index "taxons", ["permalink"], :name => "index_taxons_on_permalink"
  add_index "taxons", ["taxonomy_id"], :name => "index_taxons_on_taxonomy_id"

  create_table "tokenized_permissions", :force => true do |t|
    t.integer  "permissable_id"
    t.string   "permissable_type"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tokenized_permissions", ["permissable_id", "permissable_type"], :name => "index_tokenized_name_and_type"

  create_table "trackers", :force => true do |t|
    t.string   "environment"
    t.string   "analytics_id"
    t.boolean  "active",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "persistence_token"
    t.string   "reset_password_token"
    t.string   "perishable_token"
    t.integer  "sign_in_count",        :default => 0, :null => false
    t.integer  "failed_attempts",      :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.string   "authentication_token"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "remember_created_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "city_id"
    t.text     "description"
    t.integer  "supplier_id"
  end

  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

  create_table "variants", :force => true do |t|
    t.integer  "product_id"
    t.string   "sku",                                         :default => "",    :null => false
    t.decimal  "price",         :precision => 8, :scale => 2,                    :null => false
    t.decimal  "weight",        :precision => 8, :scale => 2
    t.decimal  "height",        :precision => 8, :scale => 2
    t.decimal  "width",         :precision => 8, :scale => 2
    t.decimal  "depth",         :precision => 8, :scale => 2
    t.datetime "deleted_at"
    t.boolean  "is_master",                                   :default => false
    t.integer  "count_on_hand",                               :default => 0,     :null => false
    t.decimal  "cost_price",    :precision => 8, :scale => 2
    t.integer  "position"
  end

  add_index "variants", ["product_id"], :name => "index_variants_on_product_id"

  create_table "zone_members", :force => true do |t|
    t.integer  "zone_id"
    t.integer  "zoneable_id"
    t.string   "zoneable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zones", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
