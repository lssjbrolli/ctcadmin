# frozen_string_literal: true

class AddVinToTrucks < ActiveRecord::Migration[4.2]
  def change
    add_column :trucks, :vin, :string
  end
end
