class AddVatRate < ActiveRecord::Migration
  def change
  	add_column :credit_invoices, :tax_rate, :string
  end
end
