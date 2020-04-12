# frozen_string_literal: true

class AddFileToCashExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    add_column :cash_expenses, :file, :string
  end
end
