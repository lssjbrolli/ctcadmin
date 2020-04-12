# frozen_string_literal: true

class AddActivatedToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :activeted, :boolean, default: false
  end
end
