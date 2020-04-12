# frozen_string_literal: true

class RemoveSellerIdFromCreditInvoices < ActiveRecord::Migration[4.2]
  def change
    remove_column :credit_invoices, :seller_id
  end
end
