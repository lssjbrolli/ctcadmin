# frozen_string_literal: true

class CreatePapers < ActiveRecord::Migration[4.2]
  def change
    create_table :papers do |t|
      t.string :description
      t.date :expire
      t.references :imageable, polymorphic: true
      t.timestamps
    end
  end
end
