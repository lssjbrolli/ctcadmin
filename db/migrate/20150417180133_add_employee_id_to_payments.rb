# frozen_string_literal: true

class AddEmployeeIdToPayments < ActiveRecord::Migration[4.2]
  def change
    add_column :payments, :employee_id, :integer
  end
end
