class AddCurrency < ActiveRecord::Migration
  def change
  	add_column :debit_invoices, :currency, :string
  end
end
