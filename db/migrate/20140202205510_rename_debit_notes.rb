class RenameDebitNotes < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		rename_table :debit_invoices, :expenses
	end
end
