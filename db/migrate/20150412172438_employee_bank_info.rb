# frozen_string_literal: true

class EmployeeBankInfo < ActiveRecord::Migration[4.2]
  def change
    add_column :employees, :bank_ron, :string
    add_column :employees, :bank_eur, :string
  end
end
