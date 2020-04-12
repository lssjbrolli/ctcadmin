# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[4.2]
  def change
    create_table :employees, &:timestamps
  end
end
