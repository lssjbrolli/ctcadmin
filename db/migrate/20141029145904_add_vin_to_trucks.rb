class AddVinToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :vin, :string
  end
end
