# frozen_string_literal: true

class PaymentsDiurnaDays < ActiveRecord::Migration[4.2]
  def change
    add_column :payments, :days, :integer
  end
end
