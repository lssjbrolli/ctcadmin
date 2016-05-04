class RenameCi < ActiveRecord::Migration
  def change
    remove_column :credit_invoices, :ci_serial
    rename_column :credit_invoices, :ci_nr, :ci
  end
end
