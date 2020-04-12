# frozen_string_literal: true

class RonValueToExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    add_column :expenses, :ron_value, :decimal, precision: 8, scale: 2
  end
end
