class CreateCreditInvoices < ActiveRecord::Migration
  def change
    create_table :credit_invoices do |t|

      t.timestamps
    end
  end
end
