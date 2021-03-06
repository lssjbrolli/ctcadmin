# frozen_string_literal: true

class ExternExpense < ActiveRecord::Base
  include ImageConvert

  before_save :convert

  validates :number, :date, :value, :currency, :supplier_id, presence: true
  validates :number, uniqueness: true

  has_many :attachments, as: :attachable

  accepts_nested_attributes_for :attachments, allow_destroy: true

  belongs_to :supplier, foreign_key: 'supplier_id', class_name: 'Company'
  belongs_to :created_by, foreign_key: 'create_id', class_name: 'User', optional: true
  belongs_to :updated_by, foreign_key: 'update_id', class_name: 'User', optional: true
end
