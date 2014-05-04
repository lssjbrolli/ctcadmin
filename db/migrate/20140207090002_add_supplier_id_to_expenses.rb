class AddSupplierIdToExpenses < ActiveRecord::Migration
	def change
		add_column :expenses, :supplier_id, :integer
	end
end
