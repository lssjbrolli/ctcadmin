class AddEmployeeIdToPayments < ActiveRecord::Migration
  def change
  	add_column :payments, :employee_id, :integer
  end
end
