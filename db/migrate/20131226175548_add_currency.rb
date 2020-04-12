# frozen_string_literal: true

class AddCurrency < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    add_column :debit_invoices, :currency, :string
  end
end
