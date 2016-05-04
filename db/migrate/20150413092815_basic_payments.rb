class BasicPayments < ActiveRecord::Migration
  def change
    add_column :payments, :salar_ron, :integer
    add_column :payments, :salar_eur, :integer
    add_column :payments, :avans, :integer
    add_column :payments, :rest, :integer
  end
end
