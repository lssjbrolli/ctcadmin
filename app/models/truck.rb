class Truck < ActiveRecord::Base
  before_save :cap

  validates :registration, :vin, presence: true
  validates :vin, uniqueness: true

  has_many :credit_notes
  has_many :events
  has_many :papers

  accepts_nested_attributes_for :papers, allow_destroy: true

  protected

  def cap
  	self.registration = self.registration.upcase
  	self.vin = self.vin.upcase
  end
end
