class AddCurrency < ActiveRecord::Migration
  def change
  	add_column :credit_invoices, :currency, :string
  	add_column :credit_notes, :currency, :string
  	add_column :debit_invoices, :currency, :string
  end
end
