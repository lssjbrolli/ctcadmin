class PaymentsDiurnaTotal < ActiveRecord::Migration
  def change
  	add_column :payments, :total, :integer
  end
end
