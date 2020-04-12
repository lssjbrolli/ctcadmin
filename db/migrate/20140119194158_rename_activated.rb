# frozen_string_literal: true

class RenameActivated < ActiveRecord::Migration[4.2]
  def change
    rename_column :users, :activeted, :activated
  end
end
