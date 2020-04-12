# frozen_string_literal: true

class AddIndexRememberToken < ActiveRecord::Migration[4.2]
  def change
    add_index :users, :remember_me
  end
end
