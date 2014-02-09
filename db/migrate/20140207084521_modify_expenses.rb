class ModifyExpenses < ActiveRecord::Migration
  def change
  	remove_column :expenses, :internal_number
  	rename_column :expenses, :total_value, :value
  	remove_column :expenses, :net_value
  	remove_column :expenses, :tax_value
  	add_column :expenses, :card, :boolean
  end
end
