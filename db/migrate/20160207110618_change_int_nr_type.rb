class ChangeIntNrType < ActiveRecord::Migration
  def change
  	change_column :trip_expenses, :intnr, :string
  end
end
