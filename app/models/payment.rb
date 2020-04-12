# frozen_string_literal: true

class Payment < ActiveRecord::Base
  before_save :set_salar_eur
  before_save :set_diurna, :set_rest, if: :diurna?
  before_update :set_updated, if: :diurna?

  validates :salar_ron, :month, presence: true
  validates :avans, presence: true, if: :diurna?

  monetize :salar_ron, as: :s_ron, allow_nil: true, with_currency: :ron
  monetize :salar_eur, as: :s_eur, allow_nil: true, with_currency: :eur
  monetize :avans, as: :avans_diurna, allow_nil: true, with_currency: :eur
  monetize :rest, as: :rest_diurna, allow_nil: true, with_currency: :eur
  monetize :total, as: :total_diurna, allow_nil: true, with_currency: :eur

  belongs_to :employee
  has_one :order

  private

  def set_salar_eur
    Money.default_bank.update_rates
    self.s_eur = s_ron.exchange_to(:eur)
  end

  def set_diurna
    self.days ||= month.end_of_month.day
    self.per_day = SiteConfig['main.diurna_zi']
    self.total_diurna = per_day * self.days
  end

  def set_rest
    self.rest_diurna = total_diurna - avans_diurna
  end

  def set_updated
    self.updated = true
  end
end
