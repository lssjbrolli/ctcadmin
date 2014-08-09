class NationalExpense < ActiveRecord::Base

	validates :number, :value, presence: true

	belongs_to :supplier, :foreign_key => 'supplier_id', :class_name => 'Company'

	mount_uploader :file, FileUploader

	PAID_BY = %w(Cash Card Bank)

	DESCRIPTION = ['Piese', 'Service', 'Asigurari', 'Leasing', 'Taxe', 'Echipament IT',
				   'Servicii curier']
end
