class RemoveFileFromRaports < ActiveRecord::Migration
	def change
		remove_column :reports, :name
		remove_column :reports, :file
	end
end
