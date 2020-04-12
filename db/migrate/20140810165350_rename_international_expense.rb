# frozen_string_literal: true

class RenameInternationalExpense < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    rename_table :international_expenses, :extern_expenses
  end
end
