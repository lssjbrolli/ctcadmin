class AddPropsToCreditNotes < ActiveRecord::Migration
	def change
		add_column :credit_notes, :number, :string
		add_column :credit_notes, :start, :string
		add_column :credit_notes, :stop, :string
		add_column :credit_notes, :week, :integer
		add_column :credit_notes, :value, :decimal, precision: 8, scale: 2
		add_column :credit_notes, :notes, :text
		add_column :credit_notes, :paid, :boolean
		add_column :credit_notes, :file, :string
		add_column :credit_notes, :currency, :string
		add_column :credit_notes, :credit_invoice_id, :integer
	end
end
