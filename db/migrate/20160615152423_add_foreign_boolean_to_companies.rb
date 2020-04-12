# frozen_string_literal: true

class AddForeignBooleanToCompanies < ActiveRecord::Migration[4.2]
  def change
    add_column :companies, :foreign, :boolean, default: false
  end
end
