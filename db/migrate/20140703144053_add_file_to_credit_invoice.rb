class AddFileToCreditInvoice < ActiveRecord::Migration
  def change
  	add_column :credit_invoices, :file, :string
  end
end
