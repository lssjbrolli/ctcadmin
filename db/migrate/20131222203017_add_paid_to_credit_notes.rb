class AddPaidToCreditNotes < ActiveRecord::Migration
  def change
  	add_column :credit_notes, :paid, :boolean
  end
end
