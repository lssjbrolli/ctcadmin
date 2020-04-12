# frozen_string_literal: true

class AddCurrencyToExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    add_column :expenses, :currency, :string
  end
end
