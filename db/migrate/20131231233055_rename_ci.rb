# frozen_string_literal: true

class RenameCi < ActiveRecord::Migration[4.2]
  def change
    remove_column :credit_invoices, :ci_serial
    rename_column :credit_invoices, :ci_nr, :ci
  end
end
