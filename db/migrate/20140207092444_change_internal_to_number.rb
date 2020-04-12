# frozen_string_literal: true

class ChangeInternalToNumber < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    rename_column :expenses, :invoice_number, :number
  end
end
