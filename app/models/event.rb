# frozen_string_literal: true

class Event < ActiveRecord::Base
  belongs_to :truck
  belongs_to :created_by, foreign_key: 'create_id', class_name: 'User', optional: true
  belongs_to :updated_by, foreign_key: 'update_id', class_name: 'User', optional: true
end
