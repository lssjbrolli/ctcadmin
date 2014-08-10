class AddFileToExpenses < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		add_column :expenses, :file, :string
	end
end
