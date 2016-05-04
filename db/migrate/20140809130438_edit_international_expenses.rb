class EditInternationalExpenses < ActiveRecord::Migration
  def change
    # noinspection RailsParamDefResolve
    remove_column :international_expenses, :value_ron
    # noinspection RailsParamDefResolve
    add_column :international_expenses, :supplier_id, :integer
  end
end
