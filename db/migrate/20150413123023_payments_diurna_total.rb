# frozen_string_literal: true

class PaymentsDiurnaTotal < ActiveRecord::Migration[4.2]
  def change
    add_column :payments, :total, :integer
  end
end
