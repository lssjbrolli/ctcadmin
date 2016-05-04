class AddOrderNrToCreditNotes < ActiveRecord::Migration
  def change
    add_column :credit_notes, :order_nr, :integer
  end
end
