class ChangeInternalToNumber < ActiveRecord::Migration
  def change
  	rename_column :expenses, :invoice_number, :number
  end
end
