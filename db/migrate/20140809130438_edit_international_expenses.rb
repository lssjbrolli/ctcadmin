# frozen_string_literal: true

class EditInternationalExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    remove_column :international_expenses, :value_ron
    # noinspection RailsParamDefResolve
    add_column :international_expenses, :supplier_id, :integer
  end
end
