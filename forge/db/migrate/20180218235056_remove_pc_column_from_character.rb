# frozen_string_literal: true

class RemovePcColumnFromCharacter < ActiveRecord::Migration[5.1]
  def change
    remove_column :characters, :pc
  end
end
