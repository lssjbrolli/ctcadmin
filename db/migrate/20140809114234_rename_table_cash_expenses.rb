class RenameTableCashExpenses < ActiveRecord::Migration
  def change
    # noinspection RailsParamDefResolve
    rename_table :cash_expenses, :national_expenses
  end
end
