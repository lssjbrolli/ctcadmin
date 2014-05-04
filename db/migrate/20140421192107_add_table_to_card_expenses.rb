class AddTableToCardExpenses < ActiveRecord::Migration
	def change
		add_column :card_expenses, :table, :boolean, :default => false
	end
end
