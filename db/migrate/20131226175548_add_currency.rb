class AddCurrency < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		add_column :debit_invoices, :currency, :string
	end
end
