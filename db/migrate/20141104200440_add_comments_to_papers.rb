class AddCommentsToPapers < ActiveRecord::Migration
  def change
  	add_column :papers, :comments, :string
  end
end
