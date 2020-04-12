# frozen_string_literal: true

class AddOrderNrToCreditNotes < ActiveRecord::Migration[4.2]
  def change
    add_column :credit_notes, :order_nr, :integer
  end
end
