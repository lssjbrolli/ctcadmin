class AddCommentsToDebitInvoices < ActiveRecord::Migration
	def change
		add_column :debit_invoices, :comment, :text
	end
end
