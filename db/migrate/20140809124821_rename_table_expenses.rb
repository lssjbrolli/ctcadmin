# frozen_string_literal: true

class RenameTableExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    rename_table :expenses, :international_expenses
  end
end
