class Raport < ActiveRecord::Base
	after_save :set_id

	has_many :card_expenses
	serialize :ids

	private

	def set_id
		self.ids.each { |x| CardExpense.find(x).update_attribute(:raport_id, self.id)}
	end
end
