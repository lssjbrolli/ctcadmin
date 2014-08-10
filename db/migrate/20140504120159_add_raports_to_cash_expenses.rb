class AddRaportsToCashExpenses < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		add_column :cash_expenses, :raport, :boolean
	end
end
