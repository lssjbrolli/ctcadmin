# frozen_string_literal: true

class AddRememberTokenToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :remember_me, :string
  end
end
