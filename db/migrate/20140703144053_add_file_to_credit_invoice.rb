# frozen_string_literal: true

class AddFileToCreditInvoice < ActiveRecord::Migration[4.2]
  def change
    add_column :credit_invoices, :file, :string
  end
end
