class AddPropsToCardExpenses < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		add_column :card_expenses, :number, :string
		# noinspection RailsParamDefResolve
		add_column :card_expenses, :date, :date
		# noinspection RailsParamDefResolve
		add_column :card_expenses, :description, :text
		# noinspection RailsParamDefResolve
		add_column :card_expenses, :value, :decimal, :precision => 8, :scale => 2
		# noinspection RailsParamDefResolve
		add_column :card_expenses, :value_eur, :decimal, :precision => 8, :scale => 2
		# noinspection RailsParamDefResolve
		add_column :card_expenses, :currency, :string
	end
end
