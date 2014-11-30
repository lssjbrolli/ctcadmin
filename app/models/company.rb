class Company < ActiveRecord::Base
	has_many :credit_invoices
	has_many :national_expenses
	has_many :extern_expenses
	belongs_to :created_by, :foreign_key => 'create_id', :class_name => 'User'
	belongs_to :updated_by, :foreign_key => 'update_id', :class_name => 'User'
end