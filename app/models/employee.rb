# frozen_string_literal: true

class Employee < ActiveRecord::Base
  before_save :set_names

  validates :first_name, :last_name, :cnp, presence: true

  has_many :payments
  has_many :papers, as: :document, dependent: :destroy
  belongs_to :created_by, foreign_key: 'create_id', class_name: 'User', optional: true
  belongs_to :updated_by, foreign_key: 'update_id', class_name: 'User', optional: true

  accepts_nested_attributes_for :papers, allow_destroy: true

  def name
    "#{first_name} #{last_name}"
  end

  private

  def set_names
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end
end
