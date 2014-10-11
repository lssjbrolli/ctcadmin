class RemoveDescFromAttachment < ActiveRecord::Migration
  def change
  	remove_column :attachments, :description
  end
end
