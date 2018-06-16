# frozen_string_literal: true

class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :experience_track

      t.timestamps
    end
  end
end
