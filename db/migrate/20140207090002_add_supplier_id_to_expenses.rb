class AddSupplierIdToExpenses < ActiveRecord::Migration
  def change
    # noinspection RailsParamDefResolve
    add_column :expenses, :supplier_id, :integer
  end
end
