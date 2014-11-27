class RemoveUserInfoOnAttachments < ActiveRecord::Migration
  def change
  	remove_column :attachments, :create_id
  	remove_column :attachments, :update_id
  end
end
