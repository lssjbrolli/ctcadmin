class UpdateSettings < ActiveRecord::Migration[6.1]
  def change
    remove_column :settings, :thing_id
    remove_column :settings, :thing_type

    add_index :settings, %i(var), unique: true
  end
end
