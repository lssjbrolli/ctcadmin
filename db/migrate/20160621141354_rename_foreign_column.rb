class RenameForeignColumn < ActiveRecord::Migration
  def change
    rename_column :companies, :foreign, :country
  end
end
