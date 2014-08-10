class RenameTableExpenses < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		rename_table :expenses, :international_expenses
	end
end
