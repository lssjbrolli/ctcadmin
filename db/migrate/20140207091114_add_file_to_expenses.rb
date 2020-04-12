# frozen_string_literal: true

class AddFileToExpenses < ActiveRecord::Migration[4.2]
  def change
    # noinspection RailsParamDefResolve
    add_column :expenses, :file, :string
  end
end
