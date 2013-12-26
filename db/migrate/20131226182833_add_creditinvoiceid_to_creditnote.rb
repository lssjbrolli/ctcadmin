class AddCreditinvoiceidToCreditnote < ActiveRecord::Migration
  def change
  	add_column :credit_notes, :credit_invoice_id, :integer
  end
end
