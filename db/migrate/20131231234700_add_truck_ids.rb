# frozen_string_literal: true

class AddTruckIds < ActiveRecord::Migration[4.2]
  def change
    add_column :credit_notes, :truck_id, :integer
    add_column :events, :truck_id, :integer
  end
end
