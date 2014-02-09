class AddInternalNumber < ActiveRecord::Migration
  def change
  	rename_column :expenses, :number, :invoice_number
  	add_column :expenses, :internal_number, :string
  end
end
