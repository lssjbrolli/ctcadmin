# frozen_string_literal: true

class RemoveDescFromAttachment < ActiveRecord::Migration[4.2]
  def change
    remove_column :attachments, :description
  end
end
