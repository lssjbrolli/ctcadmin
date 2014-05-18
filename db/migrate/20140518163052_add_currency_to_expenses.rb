class AddCurrencyToExpenses < ActiveRecord::Migration
  def change
  	add_column :expenses, :currency, :string
  end
end
