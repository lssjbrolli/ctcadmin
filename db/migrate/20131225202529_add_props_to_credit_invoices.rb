# frozen_string_literal: true

class AddPropsToCreditInvoices < ActiveRecord::Migration[4.2]
  def change
    add_column :credit_invoices, :number, :string
    add_column :credit_invoices, :date, :date
    add_column :credit_invoices, :total_value, :decimal, precision: 8, scale: 2
    add_column :credit_invoices, :seller_id, :integer
    add_column :credit_invoices, :buyer_id, :integer
    add_column :credit_invoices, :tax_rate, :string
    add_column :credit_invoices, :net_value, :decimal, precision: 8, scale: 2
    add_column :credit_invoices, :tax_value, :decimal, precision: 8, scale: 2
    add_column :credit_invoices, :currency, :string
  end
end
