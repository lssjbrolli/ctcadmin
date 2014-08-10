class TripExpense < ActiveRecord::Base
  acts_as_indexed :fields => [:int_id]

  before_save :set_int_id

  validates :number, :value, :value_eur, :date, :currency, presence: true

  mount_uploader :file, FileUploader

  CURRENCY    = %w(EUR RON HUF PLN DKK SEK NOK GBP)
  DESCRIPTION = ['Taxa drum A', 'Taxa drum RO', 'Taxa drum H', 'Taxa drum SK',
                 'Taxa drum PL', 'Taxa drum D', 'Taxa drum N', 'Eurovigneta',
                 'Taxa drum LV', 'Taxa drum LT', 'Motorina', 'Piese', 'Service',
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
