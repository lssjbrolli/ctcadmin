class Company < ActiveRecord::Base
	has_many :credit_invoices
end
