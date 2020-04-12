# frozen_string_literal: true

class ExtraAtribForTrucks < ActiveRecord::Migration[4.2]
  def change
    add_column :trucks, :truck, :boolean
    add_column :trucks, :sold, :boolean
  end
end
