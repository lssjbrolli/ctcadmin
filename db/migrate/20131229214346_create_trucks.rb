# frozen_string_literal: true

class CreateTrucks < ActiveRecord::Migration[4.2]
  def change
    create_table :trucks do |t|
      t.string :registration

      t.timestamps
    end
  end
end
