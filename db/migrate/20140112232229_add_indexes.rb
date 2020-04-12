# frozen_string_literal: true

class AddIndexes < ActiveRecord::Migration[4.2]
  def change
    add_index :users, :username, unique: true
    add_index :credit_invoices, :number, unique: true
    add_index :credit_notes, :number, unique: true
    # noinspection RailsParamDefResolve
    add_index :debit_invoices, :number, unique: true
  end
end
