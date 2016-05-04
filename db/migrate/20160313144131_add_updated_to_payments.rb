class AddUpdatedToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :updated, :boolean, default: :false
  end
end
