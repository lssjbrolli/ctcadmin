class AddValueToCreditInvoices < ActiveRecord::Migration
  def change
  	add_column :credit_invoices, :value, :decimal, precision: 8, scale: 2
  end
end
