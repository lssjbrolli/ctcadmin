# frozen_string_literal: true

class ChangeRememberMe < ActiveRecord::Migration[4.2]
  def change
    rename_column :users, :remember_me, :remember_token
  end
end
