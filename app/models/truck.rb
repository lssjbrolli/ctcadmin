# frozen_string_literal: true

class Truck < ActiveRecord::Base
  before_save :cap

  validates :registration, :vin, presence: true
  validates :vin, uniqueness: true
  # validates vin length

  has_many :credit_notes
  has_many :events
  has_many :papers, as: :document, dependent: :destroy
  belongs_to :created_by, foreign_key: 'create_id', class_name: 'User', optional: true
  belongs_to :updated_by, foreign_key: 'update_id', class_name: 'User', optional: true

  accepts_nested_attributes_for :papers, allow_destroy: true

  protected

  def cap
    self.registration = registration.upcase
    self.vin = vin.upcase
  end
end
