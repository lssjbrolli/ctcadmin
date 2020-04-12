# frozen_string_literal: true

class AddEmailToCompanies < ActiveRecord::Migration[4.2]
  def change
    add_column :companies, :email, :string
  end
end
