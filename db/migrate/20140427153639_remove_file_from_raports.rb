# frozen_string_literal: true

class RemoveFileFromRaports < ActiveRecord::Migration[4.2]
  def change
    remove_column :reports, :name
    remove_column :reports, :file
  end
end
