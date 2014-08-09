class Company < ActiveRecord::Base
	has_many :credit_invoices
	has_many :national_expenses
	has_many :international_expenses
end