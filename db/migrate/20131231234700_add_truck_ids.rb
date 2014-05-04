class AddTruckIds < ActiveRecord::Migration
	def change
		add_column :credit_notes, :truck_id, :integer
		add_column :events, :truck_id, :integer
	end
end
