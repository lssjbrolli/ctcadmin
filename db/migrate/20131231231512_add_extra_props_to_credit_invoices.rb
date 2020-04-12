# frozen_string_literal: true

class AddExtraPropsToCreditInvoices < ActiveRecord::Migration[4.2]
  def change
    add_column :credit_invoices, :delegat, :string
    add_column :credit_invoices, :ci_serial, :string
    add_column :credit_invoices, :ci_nr, :string
    add_column :credit_invoices, :eliberat, :string
    add_column :credit_invoices, :transport, :string
  end
end
