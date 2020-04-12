# frozen_string_literal: true

class RenameForeignColumn < ActiveRecord::Migration[4.2]
  def change
    rename_column :companies, :foreign, :country
  end
end
