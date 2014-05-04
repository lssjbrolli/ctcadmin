class CreateCreditNotes < ActiveRecord::Migration
	def change
		create_table :credit_notes do |t|

			t.timestamps
		end
	end
end
