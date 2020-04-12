# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[4.2]
  def change
    create_table :orders do |t|
      t.timestamps null: false
    end
  end
end
