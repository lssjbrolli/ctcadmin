class ChangeRaportAtCashExpenses < ActiveRecord::Migration
	def change
		change_column :cash_expenses, :raport, :boolean, default: false
	end
end
