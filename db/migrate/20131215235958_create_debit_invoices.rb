# frozen_string_literal: true

class CreateDebitInvoices < ActiveRecord::Migration[4.2]
  def change
    create_table :debit_invoices, &:timestamps
  end
end
