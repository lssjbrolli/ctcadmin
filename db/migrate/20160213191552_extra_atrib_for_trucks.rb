class ExtraAtribForTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :truck, :boolean
    add_column :trucks, :sold, :boolean
  end
end
