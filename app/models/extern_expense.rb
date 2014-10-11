class ExternExpense < ActiveRecord::Base
  include ImageConvert

  before_save :convert

  acts_as_indexed :fields => [:number]

  validates :number, :value, :currency, :supplier, presence: true
  validates :number, uniqueness: true

  has_many :attachments, :as => :attachable

  accepts_nested_attributes_for :attachments, allow_destroy: true

  belongs_to :supplier, :foreign_key => 'supplier_id', :class_name => 'Company'

  CURRENCY    = %w(EUR RON HUF PLN DKK SEK NOK GBP)
  DESCRIPTION = %w(Rent Loan Fuel Cash Service Parts)

  def self.search(search)
    if search && !search.empty?
      ExternExpense.with_query(search)
    else
      ExternExpense.all
    end
  end

end
