class CreateCashExpenses < ActiveRecord::Migration
  def change
    create_table :cash_expenses do |t|
      t.timestamps
    end
  end
end
