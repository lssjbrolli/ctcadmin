# frozen_string_literal: true

class AddViesValid < ActiveRecord::Migration[4.2]
  def change
    add_column :companies, :vies_valid, :boolean, default: false
  end
end
