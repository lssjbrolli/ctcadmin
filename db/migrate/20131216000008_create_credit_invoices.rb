# frozen_string_literal: true

class CreateCreditInvoices < ActiveRecord::Migration[4.2]
  def change
    create_table :credit_invoices, &:timestamps
  end
end
