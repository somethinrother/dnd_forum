# frozen_string_literal: true

class CreateSettingDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :setting_details do |t|
      t.string :title
      t.text :description
      t.integer :campaign_id

      t.timestamps
    end
  end
end
