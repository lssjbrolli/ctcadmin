class Payment < ActiveRecord::Base
  before_save :set_salar_eur
  before_save :set_diurna, :set_rest, if: 'self.diurna'
  before_update :set_updated, if: 'self.diurna'

  validates :sron, :month, presence: true
  validates :days, :avans, presence: true, if: 'self.diurna'

  monetize :salar_ron, :as => 'sron', :allow_nil => true, with_currency: :ron
  monetize :salar_eur, :as => 'seur', :allow_nil => true, with_currency: :eur

  belongs_to :employee
  has_many :bonuses
  has_one :order

  accepts_nested_attributes_for :bonuses

  private

  def set_salar_eur
    Money.default_bank.update_rates
    self.seur = self.sron.exchange_to(:eur)
    self.salar_eur = rounding(self.salar_eur)
  end

  def rounding(nr)
    b = nr.to_s

    if b[-2..-1].to_i < 50
      c = nr - b[-2..-1].to_i
    else
      c = nr + 100 - b[-2..-1].to_i
    end
  end

  def set_diurna
    self.days ||= self.month.end_of_month.day
    self.per_day = ((SiteConfig['main.diurna_baza'].to_f + set_bonus - self.salar_eur/100) / self.month.end_of_month.day).round
    self.total = self.per_day * self.days
  end

  def set_rest
    self.rest = self.total - self.avans
  end

  def set_bonus
    bonus = 0
    self.bonuses.each do |x|
      bonus += x.value.to_i
    end
    bonus
  end

  def set_updated
    self.updated = true
  end
end
