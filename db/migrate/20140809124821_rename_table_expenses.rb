class RenameTableExpenses < ActiveRecord::Migration
  def change
  	rename_table :expenses, :international_expenses
  end
end
