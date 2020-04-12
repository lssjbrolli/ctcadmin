# frozen_string_literal: true

class AddContactToCompanies < ActiveRecord::Migration[4.2]
  def change
    add_column :companies, :contact, :string
  end
end
