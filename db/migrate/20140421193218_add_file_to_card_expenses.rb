class AddFileToCardExpenses < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		add_column :card_expenses, :file, :string
	end
end
