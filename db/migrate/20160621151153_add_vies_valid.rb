class AddViesValid < ActiveRecord::Migration
  def change
    add_column :companies, :vies_valid, :boolean, default: false
  end
end
