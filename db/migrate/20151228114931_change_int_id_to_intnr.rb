# frozen_string_literal: true

class ChangeIntIdToIntnr < ActiveRecord::Migration[4.2]
  def change
    rename_column :trip_expenses, :int_id, :intnr
  end
end
