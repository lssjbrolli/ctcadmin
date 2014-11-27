class Truck < ActiveRecord::Base
  before_save :cap

  validates :registration, :vin, presence: true
  validates :vin, uniqueness: true
  #validates vin lenght

  has_many :credit_notes
  has_many :events
  has_many :papers, :as => :document, dependent: :destroy
  belongs_to :created_by, :foreign_key => 'create_id', :class_name => 'User'
  belongs_to :updated_by, :foreign_key => 'update_id', :class_name => 'User'

  accepts_nested_attributes_for :papers, allow_destroy: true

  protected

  def cap
  	self.registration = self.registration.upcase
  	self.vin = self.vin.upcase
  end
end
