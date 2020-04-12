# frozen_string_literal: true

class AddCommentsToPapers < ActiveRecord::Migration[4.2]
  def change
    add_column :papers, :comments, :string
  end
end
