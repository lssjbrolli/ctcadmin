# frozen_string_literal: true

class Paper < ActiveRecord::Base
  include ImageConvert

  after_create :cap
  before_create :convert
  before_update :convert

  belongs_to :document, polymorphic: true
  belongs_to :created_by, foreign_key: 'create_id', class_name: 'User', optional: true
  belongs_to :updated_by, foreign_key: 'update_id', class_name: 'User', optional: true

  has_many :attachments, as: :attachable, dependent: :destroy

  accepts_nested_attributes_for :attachments, allow_destroy: true

  validates :description, presence: true

  protected

  def cap
    self.description = description.capitalize unless description.nil?
    self.comments = comments.capitalize unless comments.nil?
  end
end
