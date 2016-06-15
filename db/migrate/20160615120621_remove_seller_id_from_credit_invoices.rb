class RemoveSellerIdFromCreditInvoices < ActiveRecord::Migration
  def change
    remove_column :credit_invoices, :seller_id
  end
end
