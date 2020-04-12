# frozen_string_literal: true

class CreateCashExpenses < ActiveRecord::Migration[4.2]
  def change
    create_table :cash_expenses, &:timestamps
  end
end
