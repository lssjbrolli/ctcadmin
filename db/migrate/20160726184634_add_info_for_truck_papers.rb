class AddInfoForTruckPapers < ActiveRecord::Migration
  def change
    add_column :papers, :is_info, :boolean, default: false
  end
end
