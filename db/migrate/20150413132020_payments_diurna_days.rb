class PaymentsDiurnaDays < ActiveRecord::Migration
  def change
    add_column :payments, :days, :integer
  end
end
