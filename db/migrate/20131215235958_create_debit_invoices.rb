class CreateDebitInvoices < ActiveRecord::Migration
	def change
		create_table :debit_invoices do |t|

			t.timestamps
		end
	end
end
