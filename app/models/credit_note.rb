class CreditNote < ActiveRecord::Base

	before_destroy :remove_file

	belongs_to :truck
	belongs_to :credit_invoice

	validates :number, presence: true, uniqueness: true
	validates :value, presence: true

	mount_uploader :file, FileUploader

	CURRENCY = %w(EUR RON)

	def remove_file
		self.remove_file!
	end

end
