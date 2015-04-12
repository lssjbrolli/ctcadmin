class EmployeeBankInfo < ActiveRecord::Migration
  def change
  	add_column :employees, :bank_ron, :string
  	add_column :employees, :bank_eur, :string
  end
end
