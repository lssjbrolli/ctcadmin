class AddPaymentToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_id, :integer
  end
end
