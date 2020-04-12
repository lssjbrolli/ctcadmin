# frozen_string_literal: true

class FixPapersMigration < ActiveRecord::Migration[4.2]
  def change
    rename_column :papers, :imageable_id, :document_id
    rename_column :papers, :imageable_type, :document_type
  end
end
