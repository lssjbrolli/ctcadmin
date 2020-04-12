# frozen_string_literal: true

class AddInfoForTruckPapers < ActiveRecord::Migration[4.2]
  def change
    add_column :papers, :is_info, :boolean, default: false
  end
end
