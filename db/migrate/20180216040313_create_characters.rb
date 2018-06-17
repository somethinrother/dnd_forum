# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[5.1]
  # rubocop:disable Metrics/MethodLength
  def change
    create_table :characters do |t|
      t.integer :user_id
      t.integer :campaign_id
      t.string :name
      t.text :description
      t.string :primary_class
      t.string :secondary_class
      t.string :tertiary_class
      t.boolean :pc
      t.string :location
      t.integer :level
      t.integer :copper
      t.integer :silver
      t.integer :gold
      t.integer :platinum
      t.integer :experience

      t.timestamps
    end
    # rubocop:enable Metrics/MethodLength
  end
end
