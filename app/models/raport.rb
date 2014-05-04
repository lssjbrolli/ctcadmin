class Raport < ActiveRecord::Base
	has_many :card_expenses
	has_many :cash_expenses
	serialize :ids
end
