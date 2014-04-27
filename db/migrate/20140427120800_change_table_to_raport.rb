class ChangeTableToRaport < ActiveRecord::Migration
  def change
  	rename_column :card_expenses, :table, :raport
  end
end
