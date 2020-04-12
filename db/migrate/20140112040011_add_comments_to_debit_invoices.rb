# frozen_string_literal: true

class AddCommentsToDebitInvoices < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    add_column :debit_invoices, :comment, :text
  end
end
