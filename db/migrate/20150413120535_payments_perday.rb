class PaymentsPerday < ActiveRecord::Migration
  def change
    add_column :payments, :per_day, :integer
  end
end
