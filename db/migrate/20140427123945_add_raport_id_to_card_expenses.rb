# frozen_string_literal: true

class AddRaportIdToCardExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    add_column :card_expenses, :raport_id, :integer
  end
end
