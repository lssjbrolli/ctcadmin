# frozen_string_literal: true

class PaymentsMonth < ActiveRecord::Migration[4.2]
  def change
    add_column :payments, :month, :date
  end
end
