class AddFileToCashExpenses < ActiveRecord::Migration
  def change
    # noinspection RailsParamDefResolve
    add_column :cash_expenses, :file, :string
  end
end
