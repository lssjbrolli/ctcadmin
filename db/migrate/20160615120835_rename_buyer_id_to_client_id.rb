class RenameBuyerIdToClientId < ActiveRecord::Migration
  def change
    rename_column :credit_invoices, :buyer_id, :client_id
  end
end
