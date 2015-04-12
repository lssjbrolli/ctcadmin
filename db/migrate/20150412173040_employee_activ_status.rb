class EmployeeActivStatus < ActiveRecord::Migration
  def change
  	add_column :employees, :activ, :boolean, default: true
  end
end
