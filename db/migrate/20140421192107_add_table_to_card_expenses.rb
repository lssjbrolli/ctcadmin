class AddTableToCardExpenses < ActiveRecord::Migration
  def change
    # noinspection RailsParamDefResolve
    add_column :card_expenses, :table, :boolean, :default => false
  end
end
