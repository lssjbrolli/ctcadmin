class AddPropsToCashExpenses < ActiveRecord::Migration
  def change
  	add_column :cash_expenses, :number, :string
    add_column :cash_expenses, :date, :date
    add_column :cash_expenses, :description, :text
    add_column :cash_expenses, :currency, :string
    add_column :cash_expenses, :value, :decimal, precision: 8, scale: 2
    add_column :cash_expenses, :value_ron, :decimal, precision: 8, scale: 2
    add_column :cash_expenses, :raport_id, :integer

  end
end
