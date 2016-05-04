class Report < ActiveRecord::Base
  has_many :trip_expenses
  serialize :ids
end
