class AddInternalNumber < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		rename_column :expenses, :number, :invoice_number
		# noinspection RailsParamDefResolve
		add_column :expenses, :internal_number, :string
	end
end
