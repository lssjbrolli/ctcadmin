class EditInternationalExpenses < ActiveRecord::Migration
  def change
  	remove_column :international_expenses, :value_ron
  	add_column :international_expenses, :supplier_id, :integer
  end
end
