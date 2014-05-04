class CreateCardExpenses < ActiveRecord::Migration
	def change
		create_table :card_expenses do |t|

			t.timestamps
		end
	end
end
