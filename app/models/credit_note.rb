class CreditNote < ActiveRecord::Base
	include ImageConvert

	before_save :convert

	belongs_to :truck
	belongs_to :credit_invoice
	belongs_to :created_by, :foreign_key => 'create_id', :class_name => 'User'
	belongs_to :updated_by, :foreign_key => 'update_id', :class_name => 'User'

	has_many :attachments, :as => :attachable, dependent: :destroy

	accepts_nested_attributes_for :attachments, allow_destroy: true

	validates :number, presence: true, uniqueness: true
	validates :value, :currency, presence: true

end