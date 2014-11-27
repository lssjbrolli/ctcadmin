class TripExpense < ActiveRecord::Base
  include ImageConvert

  before_save :convert

  acts_as_indexed :fields => [:number]

  before_save :set_int_id

  validates :number, :value, :value_eur, :date, :currency, presence: true

  has_many :attachments, :as => :attachable
  belongs_to :created_by, :foreign_key => 'create_id', :class_name => 'User'
  belongs_to :updated_by, :foreign_key => 'update_id', :class_name => 'User'

  accepts_nested_attributes_for :attachments, allow_destroy: true

  CURRENCY    = %w(EUR RON HUF PLN DKK SEK NOK GBP)
  DESCRIPTION = ['Taxa drum', 'Motorina', 'Piese', 'Service', 'Transport',
                 'Telefon', 'Altele'].sort

  protected

  def set_int_id
    if self.int_id.nil?
      if TripExpense.last.int_id.nil?
        self.int_id = 1
      else
        self.int_id = TripExpense.last.int_id.next
      end
    end
  end

  def self.search(search)
    if search && !search.empty?
      TripExpense.with_query(search)
    else
      TripExpense.all
    end
  end

end
