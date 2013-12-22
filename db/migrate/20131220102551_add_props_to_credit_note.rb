class AddPropsToCreditNote < ActiveRecord::Migration
  def change
  	add_column :credit_notes, :number, :integer
  	add_column :credit_notes, :start, :string
  	add_column :credit_notes, :stop, :string
  	add_column :credit_notes, :week, :integer
  	add_column :credit_notes, :value, :decimal, precision: 8, scale: 2
  	add_column :credit_notes, :notes, :text
  end
end
