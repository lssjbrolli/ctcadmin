class AddRaportsToCashExpenses < ActiveRecord::Migration
  def change
  	add_column :cash_expenses, :raport, :boolean
  end
end
