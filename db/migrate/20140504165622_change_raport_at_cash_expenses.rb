class ChangeRaportAtCashExpenses < ActiveRecord::Migration
  def change
    # noinspection RailsParamDefResolve
    change_column :cash_expenses, :raport, :boolean, default: false
  end
end
