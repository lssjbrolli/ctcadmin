class RenameInternationalToExtern < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		rename_table :international_expenses, :extern_expenses
	end
end