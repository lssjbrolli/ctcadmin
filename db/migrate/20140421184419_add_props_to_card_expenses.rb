class AddPropsToCardExpenses < ActiveRecord::Migration
  def change
  	add_column :card_expenses, :number, :string
  	add_column :card_expenses, :date, :date
  	add_column :card_expenses, :description, :text
  	add_column :card_expenses, :value, :decimal, :precision => 8, :scale => 2
  	add_column :card_expenses, :value_eur, :decimal, :precision => 8, :scale => 2
  	add_column :card_expenses, :currency, :string
  end
end
