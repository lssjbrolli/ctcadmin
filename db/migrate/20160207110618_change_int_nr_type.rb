# frozen_string_literal: true

class ChangeIntNrType < ActiveRecord::Migration[4.2]
  def change
    change_column :trip_expenses, :intnr, :string
  end
end
