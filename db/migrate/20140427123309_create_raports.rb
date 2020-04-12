# frozen_string_literal: true

class CreateRaports < ActiveRecord::Migration[4.2]
  def change
    create_table :reports do |t|
      t.string :name
      t.string :file
      t.timestamps
    end
  end
end
