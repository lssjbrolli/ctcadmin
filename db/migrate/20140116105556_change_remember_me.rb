class ChangeRememberMe < ActiveRecord::Migration
  def change
  	rename_column :users, :remember_me, :remember_token
  end
end
