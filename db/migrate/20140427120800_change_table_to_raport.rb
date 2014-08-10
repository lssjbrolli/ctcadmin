class ChangeTableToRaport < ActiveRecord::Migration
	def change
		# noinspection RailsParamDefResolve
		rename_column :card_expenses, :table, :raport
	end
end
