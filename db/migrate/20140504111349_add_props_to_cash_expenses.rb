class AddPropsToCashExpenses < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		add_column :cash_expenses, :number, :string
		# noinspection RailsParamDefResolve
		add_column :cash_expenses, :date, :date
		# noinspection RailsParamDefResolve
		add_column :cash_expenses, :description, :text
		# noinspection RailsParamDefResolve
		add_column :cash_expenses, :currency, :string
		# noinspection RailsParamDefResolve
		add_column :cash_expenses, :value, :decimal, precision: 8, scale: 2
		# noinspection RailsParamDefResolve
		add_column :cash_expenses, :value_ron, :decimal, precision: 8, scale: 2
		# noinspection RailsParamDefResolve
		add_column :cash_expenses, :raport_id, :integer

	end
end
