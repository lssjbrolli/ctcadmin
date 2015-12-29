class TripExpense < ActiveRecord::Base
	include ImageConvert

	before_save :convert

	before_save :set_intnr

	validates   :number, :value, :value_eur, :date, :currency, presence: true

	has_many    :attachments, :as => :attachable
	belongs_to  :created_by, :foreign_key => 'create_id', :class_name => 'User'
	belongs_to  :updated_by, :foreign_key => 'update_id', :class_name => 'User'
	belongs_to  :report

	accepts_nested_attributes_for :attachments, allow_destroy: true

	CURRENCY    = %w(EUR RON HUF PLN DKK SEK NOK GBP)
	DESCRIPTION = ['Taxa drum', 'Motorina', 'Piese', 'Service', 'Transport',
								 'Telefon', 'Altele'].sort

	protected

	def set_intnr
		if self.intnr.nil?
			if TripExpense.last.intnr.nil?
				self.intnr = 1
			else
				self.intnr = TripExpense.last.intnr.next
			end
		end
	end

	def self.missing
		TripExpense.where(report: nil)
	end

end
