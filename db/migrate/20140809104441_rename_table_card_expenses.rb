# frozen_string_literal: true

class RenameTableCardExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    rename_table :card_expenses, :trip_expenses
  end
end
