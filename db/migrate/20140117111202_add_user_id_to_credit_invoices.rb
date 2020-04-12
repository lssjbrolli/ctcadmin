# frozen_string_literal: true

class AddUserIdToCreditInvoices < ActiveRecord::Migration[4.2]
  def change
    add_column :credit_invoices, :user_id, :integer
  end
end
