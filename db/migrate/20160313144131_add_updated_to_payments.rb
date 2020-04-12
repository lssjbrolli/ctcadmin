# frozen_string_literal: true

class AddUpdatedToPayments < ActiveRecord::Migration[4.2]
  def change
    add_column :payments, :updated, :boolean, default: false
  end
end
