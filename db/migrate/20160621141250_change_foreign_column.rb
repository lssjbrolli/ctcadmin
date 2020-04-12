# frozen_string_literal: true

class ChangeForeignColumn < ActiveRecord::Migration[4.2]
  def change
    change_column :companies, :foreign, :string
  end
end
