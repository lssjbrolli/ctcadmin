# frozen_string_literal: true

class RemoveFileFields < ActiveRecord::Migration[4.2]
  def change
    remove_column :credit_invoices, :file
    remove_column :credit_notes, :file
    remove_column :national_expenses, :file
    remove_column :trip_expenses, :file
  end
end
