# frozen_string_literal: true

class RenameTableCashExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    rename_table :cash_expenses, :national_expenses
  end
end
