# frozen_string_literal: true

class AddUserIdColumnToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :user_id, :integer
  end
end
