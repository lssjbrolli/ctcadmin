class RenameActivated < ActiveRecord::Migration
  def change
    rename_column :users, :activeted, :activated
  end
end
