class AddPropsToCreditInvoices < ActiveRecord::Migration
  def change
  	add_column :credit_invoices, :number, :integer
  	add_column :credit_invoices, :date, :date
  end
end
