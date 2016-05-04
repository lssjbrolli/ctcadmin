class AddCurrencyToExpenses < ActiveRecord::Migration
  def change
    # noinspection RailsParamDefResolve
    add_column :expenses, :currency, :string
  end
end
