# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :details
      t.integer :value
      t.boolean :attached_sheet, default: false
      t.boolean :is_cash, default: false
      t.integer :campaign_id
      t.integer :character_id

      t.timestamps
    end
  end
end
