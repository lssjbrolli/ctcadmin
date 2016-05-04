class RonValueToExpenses < ActiveRecord::Migration
  def change
    # noinspection RailsParamDefResolve
    add_column :expenses, :ron_value, :decimal, precision: 8, scale: 2
  end
end
