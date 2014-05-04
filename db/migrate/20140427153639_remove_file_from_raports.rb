class RemoveFileFromRaports < ActiveRecord::Migration
	def change
		remove_column :raports, :name
		remove_column :raports, :file
	end
end
