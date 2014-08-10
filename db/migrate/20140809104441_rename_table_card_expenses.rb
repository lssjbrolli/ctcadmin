class RenameTableCardExpenses < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		rename_table :card_expenses, :trip_expenses
	end
end
