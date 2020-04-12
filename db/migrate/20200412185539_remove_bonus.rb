# frozen_string_literal: true

class RemoveBonus < ActiveRecord::Migration[5.2]
  def change
    drop_table :bonuses
  end
end
