# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_180_218_235_056) do
  enable_extension 'plpgsql'

  create_table 'blue_books', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.string 'reward'
    t.integer 'chapter_id'
    t.integer 'character_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'campaigns', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'title'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'chapters', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.integer 'campaign_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'characters', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'campaign_id'
    t.string 'name'
    t.text 'description'
    t.string 'primary_class'
    t.string 'secondary_class'
    t.string 'tertiary_class'
    t.string 'location'
    t.integer 'level'
    t.integer 'copper'
    t.integer 'silver'
    t.integer 'gold'
    t.integer 'platinum'
    t.integer 'experience'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'items', force: :cascade do |t|
    t.string 'name'
    t.text 'details'
    t.float 'value'
    t.boolean 'attached_sheet', default: false
    t.boolean 'is_cash', default: false
    t.integer 'campaign_id'
    t.integer 'character_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'notes', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.string 'notable_type'
    t.bigint 'notable_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.index %w[notable_type notable_id], name: 'index_notes_on_notable_type_and_notable_id' # rubocop:disable Metrics/LineLength
  end

  create_table 'setting_details', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.integer 'campaign_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
