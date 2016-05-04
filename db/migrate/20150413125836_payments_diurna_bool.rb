class PaymentsDiurnaBool < ActiveRecord::Migration
  def change
    add_column :payments, :diurna, :boolean, default: true
  end
end
