# frozen_string_literal: true

class TripExpense < ActiveRecord::Base
  include ImageConvert

  before_save :convert

  before_save :set_intnr

  validates :number, :value, :value_eur, :date, :currency, presence: true
  validates :intnr, uniqueness: true

  has_many :attachments, as: :attachable
  belongs_to :created_by, foreign_key: 'create_id', class_name: 'User', optional: true
  belongs_to :updated_by, foreign_key: 'update_id', class_name: 'User', optional: true
  belongs_to :report, optional: true

  accepts_nested_attributes_for :attachments, allow_destroy: true

  def self.missing
    TripExpense.where(report: nil)
  end

  protected

  def set_intnr
    return unless intnr.empty?

    self.intnr = TripExpense.last.intnr.empty? ? 1 : TripExpense.last.intnr.next
  end
end
