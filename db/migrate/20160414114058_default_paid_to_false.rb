class DefaultPaidToFalse < ActiveRecord::Migration
  def change
  	change_column :credit_notes, :paid, :boolean, default: false
  end
end
