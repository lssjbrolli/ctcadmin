# frozen_string_literal: true

class EmployeeActivStatus < ActiveRecord::Migration[4.2]
  def change
    add_column :employees, :activ, :boolean, default: true
  end
end
