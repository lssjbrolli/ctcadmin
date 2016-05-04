class RemoveLabelsFromSettings < ActiveRecord::Migration
  def change
    remove_column :settings, :label
  end
end
