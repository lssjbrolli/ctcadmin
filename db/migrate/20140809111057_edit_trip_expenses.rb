# frozen_string_literal: true

class EditTripExpenses < ActiveRecord::Migration[4.2]
  def change
    add_column :trip_expenses, :int_id, :integer
    add_column :trip_expenses, :card, :boolean, default: true
  end
end
