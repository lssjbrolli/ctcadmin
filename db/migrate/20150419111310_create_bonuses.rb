# frozen_string_literal: true

class CreateBonuses < ActiveRecord::Migration[4.2]
  def change
    create_table :bonuses do |t|
      t.string :value
      t.string :comment
      t.integer :payment_id
      t.timestamps
    end
  end
end
