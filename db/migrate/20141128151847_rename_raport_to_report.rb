class RenameRaportToReport < ActiveRecord::Migration
  def change
    rename_table :reports, :reports
  end
end
