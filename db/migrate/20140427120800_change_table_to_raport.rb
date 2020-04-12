# frozen_string_literal: true

class ChangeTableToRaport < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    rename_column :card_expenses, :table, :raport
  end
end
