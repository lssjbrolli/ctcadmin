# frozen_string_literal: true

class NationalExpense < ActiveRecord::Base
  include ImageConvert

  before_save :convert

  validates :number, :value, :supplier, presence: true

  belongs_to :supplier, foreign_key: 'supplier_id', class_name: 'Company'
  belongs_to :created_by, foreign_key: 'create_id', class_name: 'User', optional: true
  belongs_to :updated_by, foreign_key: 'update_id', class_name: 'User', optional: true

  has_many :attachments, as: :attachable

  accepts_nested_attributes_for :attachments, allow_destroy: true
end
