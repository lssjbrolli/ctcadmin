# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[4.2]
  def change
    create_table :events do |t|
      t.date :date
      t.string :km
      t.text :comment

      t.timestamps
    end
  end
end
