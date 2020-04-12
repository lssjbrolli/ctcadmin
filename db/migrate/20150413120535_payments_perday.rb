# frozen_string_literal: true

class PaymentsPerday < ActiveRecord::Migration[4.2]
  def change
    add_column :payments, :per_day, :integer
  end
end
