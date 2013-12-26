class ChangeCreditInvoiceNumberToString < ActiveRecord::Migration
  def change
  	change_column :credit_invoices, :number, :string
  end
end
