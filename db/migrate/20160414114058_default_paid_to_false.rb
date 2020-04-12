# frozen_string_literal: true

class DefaultPaidToFalse < ActiveRecord::Migration[4.2]
  def change
    change_column :credit_notes, :paid, :boolean, default: false
  end
end
