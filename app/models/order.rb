# frozen_string_literal: true

class Order < ActiveRecord::Base
  belongs_to :payment
  has_many :attachments, as: :attachable, dependent: :destroy

  accepts_nested_attributes_for :payment
  accepts_nested_attributes_for :attachments, allow_destroy: true
end
