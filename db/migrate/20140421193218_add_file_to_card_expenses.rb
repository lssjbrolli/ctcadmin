# frozen_string_literal: true

class AddFileToCardExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    add_column :card_expenses, :file, :string
  end
end
