# frozen_string_literal: true

class ModifyExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    remove_column :expenses, :internal_number
    # noinspection RailsParamDefResolve
    rename_column :expenses, :total_value, :value
    # noinspection RailsParamDefResolve
    remove_column :expenses, :net_value
    # noinspection RailsParamDefResolve
    remove_column :expenses, :tax_value
    # noinspection RailsParamDefResolve
    add_column :expenses, :card, :boolean
  end
end
