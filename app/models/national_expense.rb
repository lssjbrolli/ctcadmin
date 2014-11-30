class NationalExpense < ActiveRecord::Base
	include ImageConvert

	before_save :convert

	acts_as_indexed :fields => [:number]

	validates :number, :value, :supplier, presence: true

	belongs_to :supplier, :foreign_key => 'supplier_id', :class_name => 'Company'
	belongs_to :created_by, :foreign_key => 'create_id', :class_name => 'User'
	belongs_to :updated_by, :foreign_key => 'update_id', :class_name => 'User'

	has_many :attachments, :as => :attachable

	accepts_nested_attributes_for :attachments, allow_destroy: true

	PAID_BY = %w(Cash Card Bank)

	DESCRIPTION = ['Piese', 'Service', 'Asigurari', 'Leasing', 'Taxe', 'Echipament IT',
								 'Servicii curier', 'Transport', 'Altele']


	def self.search(search)
		if search && !search.empty?
			NationalExpense.with_query(search)
		else
			NationalExpense.all
		end
	end

end
