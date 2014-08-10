class AddRaportIdToCardExpenses < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		add_column :card_expenses, :raport_id, :integer
	end
end
