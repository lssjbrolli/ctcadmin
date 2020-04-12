# frozen_string_literal: true

class PaymentsDiurnaBool < ActiveRecord::Migration[4.2]
  def change
    add_column :payments, :diurna, :boolean, default: true
  end
end
