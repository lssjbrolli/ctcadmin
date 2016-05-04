class FixPapersMigration < ActiveRecord::Migration
  def change
    rename_column :papers, :imageable_id, :document_id
    rename_column :papers, :imageable_type, :document_type
  end
end
