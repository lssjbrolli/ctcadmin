class AddBuyersAndSellersToCreditInvoices < ActiveRecord::Migration
  def change
  	add_column :credit_invoices, :seller_id, :integer
  	add_column :credit_invoices, :buyer_id, :integer
  end
end
