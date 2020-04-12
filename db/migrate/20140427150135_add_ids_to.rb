# frozen_string_literal: true

class AddIdsTo < ActiveRecord::Migration[4.2]
  def change
    add_column :reports, :ids, :text
  end
end
