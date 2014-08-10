class AddPropsToDebitInvoices < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		add_column :debit_invoices, :number, :string
		# noinspection RailsParamDefResolve
		add_column :debit_invoices, :date, :date
		# noinspection RailsParamDefResolve
		add_column :debit_invoices, :total_value, :decimal, precision: 8, scale: 2
		# noinspection RailsParamDefResolve
		add_column :debit_invoices, :net_value, :decimal, precision: 8, scale: 2
		# noinspection RailsParamDefResolve
		add_column :debit_invoices, :tax_value, :decimal, precision: 8, scale: 2
	end
end
