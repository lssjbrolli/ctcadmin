class PaymentsMonth < ActiveRecord::Migration
  def change
    add_column :payments, :month, :date
  end
end
