class RenameDebitNotes < ActiveRecord::Migration
	def change
		rename_table :debit_invoices, :expenses
	end
end
