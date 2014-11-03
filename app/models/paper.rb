class Paper < ActiveRecord::Base
	has_many :attachments, :as => :attachable, dependent: :destroy
	accepts_nested_attributes_for :attachments, allow_destroy: true

	validates :description, presence: true
end
