class CreditNote < ActiveRecord::Base
  include ImageConvert

  before_save :convert

  acts_as_indexed :fields => [:number]

  belongs_to :truck
  belongs_to :credit_invoice

  has_many :attachments, :as => :attachable, dependent: :destroy
  
  accepts_nested_attributes_for :attachments, allow_destroy: true, :reject_if => proc {|attributes| attributes['file'].blank? && attributes['file_cache'].blank?}

  validates :number, presence: true, uniqueness: true
  validates :value, :currency, presence: true

  CURRENCY = %w(EUR RON)

  def self.search(search)
    if search && !search.empty?
      CreditNote.with_query(search)
    else
      CreditNote.all
    end
  end

end