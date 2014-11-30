class RenameRaportToReport < ActiveRecord::Migration
  def change
    rename_table :raports, :reports
  end
end
