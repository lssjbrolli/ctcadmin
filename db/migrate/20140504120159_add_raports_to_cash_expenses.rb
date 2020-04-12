# frozen_string_literal: true

class AddRaportsToCashExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    add_column :cash_expenses, :raport, :boolean
  end
end
