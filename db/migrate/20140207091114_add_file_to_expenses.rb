class AddFileToExpenses < ActiveRecord::Migration
  def change
  	add_column :expenses, :file, :string
  end
end
