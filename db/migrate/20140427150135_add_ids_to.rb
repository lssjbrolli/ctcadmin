class AddIdsTo < ActiveRecord::Migration
  def change
  	add_column :raports, :ids, :text
  end
end
