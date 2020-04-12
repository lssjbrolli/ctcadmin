# frozen_string_literal: true

class AddPaymentToOrders < ActiveRecord::Migration[4.2]
  def change
    add_column :orders, :payment_id, :integer
  end
end
