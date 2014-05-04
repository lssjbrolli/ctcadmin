class AddRaportIdToCardExpenses < ActiveRecord::Migration
	def change
		add_column :card_expenses, :raport_id, :integer
	end
end
