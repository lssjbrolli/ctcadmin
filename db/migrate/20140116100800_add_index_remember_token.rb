class AddIndexRememberToken < ActiveRecord::Migration
  def change
    add_index :users, :remember_me
  end
end
