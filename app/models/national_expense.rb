class NationalExpense < ActiveRecord::Base
  acts_as_indexed :fields => [:number]

  validates :number, :value, presence: true

  belongs_to :supplier, :foreign_key => 'supplier_id', :class_name => 'Company'
  has_many :attachments, :as => :attachable
  accepts_nested_attributes_for :attachments, allow_destroy: true

  PAID_BY = %w(Cash Card Bank)

  DESCRIPTION = ['Piese', 'Service', 'Asigurari', 'Leasing', 'Taxe', 'Echipament IT',
                 'Servicii curier']



  def self.search(search)
    if search && !search.empty?
      NationalExpense.with_query(search)
    else
      NationalExpense.all
    end
  end
  
end
