class RenameTableCashExpenses < ActiveRecord::Migration
  def change
  	rename_table :cash_expenses, :national_expenses
  end
end
