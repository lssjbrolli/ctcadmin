class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :users, :username, unique: true
  	add_index :credit_invoices, :number, unique: true
  	add_index :credit_notes, :number, unique: true
  	add_index :debit_invoices, :number, unique: true
  	
  end
end
