# frozen_string_literal: true

class CreateCardExpenses < ActiveRecord::Migration[4.2]
  def change
    create_table :card_expenses, &:timestamps
  end
end
