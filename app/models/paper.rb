class Paper < ActiveRecord::Base
	include ImageConvert

  	after_create :cap
  	before_create :convert
  	before_update :convert
  	
	belongs_to :document, polymorphic: true
	
	has_many :attachments, :as => :attachable, dependent: :destroy
	
	accepts_nested_attributes_for :attachments, allow_destroy: true

	validates :description, presence: true

	protected

	def cap
		unless self.description.nil?
			self.description = self.description.capitalize
		end
  		unless self.comments.nil?
  			self.comments = self.comments.capitalize
  		end
	end
end
