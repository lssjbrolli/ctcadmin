class AddPropsToDebitInvoices < ActiveRecord::Migration
  def change
  	add_column :debit_invoices, :number, :string
  	add_column :debit_invoices, :date, :date
  	add_column :debit_invoices, :total_value, :decimal, precision: 8, scale: 2
  	add_column :debit_invoices, :net_value, :decimal, precision: 8, scale: 2
  	add_column :debit_invoices, :tax_value, :decimal, precision: 8, scale: 2
  end
end
