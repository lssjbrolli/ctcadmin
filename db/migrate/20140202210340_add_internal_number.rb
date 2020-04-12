# frozen_string_literal: true

class AddInternalNumber < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    rename_column :expenses, :number, :invoice_number
    # noinspection RailsParamDefResolve
    add_column :expenses, :internal_number, :string
  end
end
