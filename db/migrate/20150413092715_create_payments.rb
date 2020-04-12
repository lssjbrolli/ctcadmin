# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[4.2]
  def change
    create_table :payments, &:timestamps
  end
end
