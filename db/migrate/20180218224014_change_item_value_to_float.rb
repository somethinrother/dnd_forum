# frozen_string_literal: true

class ChangeItemValueToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :value, :float
  end
end
