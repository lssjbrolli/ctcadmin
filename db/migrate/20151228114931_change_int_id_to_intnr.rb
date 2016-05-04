class ChangeIntIdToIntnr < ActiveRecord::Migration
  def change
    rename_column :trip_expenses, :int_id, :intnr
  end
end
