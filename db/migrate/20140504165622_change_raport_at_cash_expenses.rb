# frozen_string_literal: true

class ChangeRaportAtCashExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    change_column :cash_expenses, :raport, :boolean, default: false
  end
end
