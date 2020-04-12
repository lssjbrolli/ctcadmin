# frozen_string_literal: true

class RenameDebitNotes < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    rename_table :debit_invoices, :expenses
  end
end
