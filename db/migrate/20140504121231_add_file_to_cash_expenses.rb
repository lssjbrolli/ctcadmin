class AddFileToCashExpenses < ActiveRecord::Migration
  def change
  	add_column :cash_expenses, :file, :string
  end
end
