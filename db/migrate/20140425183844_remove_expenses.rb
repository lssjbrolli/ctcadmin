# frozen_string_literal: true

class RemoveExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    drop_table :expenses
  end
end
