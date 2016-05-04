class AddCommentsToDebitInvoices < ActiveRecord::Migration
  def change
    # noinspection RailsParamDefResolve
    add_column :debit_invoices, :comment, :text
  end
end
