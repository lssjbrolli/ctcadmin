# frozen_string_literal: true

class AddSupplierIdToExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    add_column :expenses, :supplier_id, :integer
  end
end
