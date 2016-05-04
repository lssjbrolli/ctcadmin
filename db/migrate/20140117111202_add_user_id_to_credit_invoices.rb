class AddUserIdToCreditInvoices < ActiveRecord::Migration
  def change
    add_column :credit_invoices, :user_id, :integer
  end
end
