class Truck < ActiveRecord::Base
	has_many :credit_notes
	has_many :events
end
