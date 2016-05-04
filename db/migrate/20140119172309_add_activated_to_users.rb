class AddActivatedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activeted, :boolean, default: false
  end
end
