class AddUserCreateUpdateInfo < ActiveRecord::Migration
  def change
  	add_column :attachments, :create_id, :integer
  	add_column :attachments, :update_id, :integer
  	add_column :companies, :create_id, :integer
  	add_column :companies, :update_id, :integer
  	add_column :credit_invoices, :create_id, :integer
  	add_column :credit_invoices, :update_id, :integer
  	add_column :credit_notes, :create_id, :integer
  	add_column :credit_notes, :update_id, :integer
  	add_column :events, :create_id, :integer
  	add_column :events, :update_id, :integer
  	add_column :extern_expenses, :create_id, :integer
  	add_column :extern_expenses, :update_id, :integer
  	add_column :national_expenses, :create_id, :integer
  	add_column :national_expenses, :update_id, :integer
  	add_column :papers, :create_id, :integer
  	add_column :papers, :update_id, :integer
  	add_column :trip_expenses, :create_id, :integer
  	add_column :trip_expenses, :update_id, :integer
  	add_column :trucks, :create_id, :integer
  	add_column :trucks, :update_id, :integer
  end
end
