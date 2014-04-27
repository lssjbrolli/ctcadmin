class Raport < ActiveRecord::Base
	has_many :card_expenses

	mount_uploader :file, FileUploader
end
