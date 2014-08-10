class EditNationalExpenses < ActiveRecord::Migration
	def change
		remove_column :national_expenses, :currency
		remove_column :national_expenses, :value_ron
		remove_column :national_expenses, :raport_id
		remove_column :national_expenses, :raport
		add_column :national_expenses, :supplier_id, :integer
		add_column :national_expenses, :paid_by, :string
	end
end
