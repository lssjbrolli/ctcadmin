# frozen_string_literal: true

class BasicEmployees < ActiveRecord::Migration[4.2]
  def change
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :cnp, :string
  end
end
