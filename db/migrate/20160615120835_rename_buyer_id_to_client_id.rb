# frozen_string_literal: true

class RenameBuyerIdToClientId < ActiveRecord::Migration[4.2]
  def change
    rename_column :credit_invoices, :buyer_id, :client_id
  end
end
