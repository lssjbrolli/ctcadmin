# frozen_string_literal: true

class BasicPayments < ActiveRecord::Migration[4.2]
  def change
    add_column :payments, :salar_ron, :integer
    add_column :payments, :salar_eur, :integer
    add_column :payments, :avans, :integer
    add_column :payments, :rest, :integer
  end
end
