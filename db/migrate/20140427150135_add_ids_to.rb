class AddIdsTo < ActiveRecord::Migration
  def change
    add_column :reports, :ids, :text
  end
end
