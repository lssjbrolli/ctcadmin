class RemoveExpenses < ActiveRecord::Migration
  def change
    # noinspection RailsParamDefResolve
    drop_table :expenses
  end
end
