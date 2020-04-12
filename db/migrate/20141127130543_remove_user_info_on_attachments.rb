# frozen_string_literal: true

class RemoveUserInfoOnAttachments < ActiveRecord::Migration[4.2]
  def change
    remove_column :attachments, :create_id
    remove_column :attachments, :update_id
  end
end
