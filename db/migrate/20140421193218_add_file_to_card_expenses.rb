class AddFileToCardExpenses < ActiveRecord::Migration
  def change
  	add_column :card_expenses, :file, :string
  end
end
