# frozen_string_literal: true

class AddTableToCardExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    add_column :card_expenses, :table, :boolean, default: false
  end
end
