# frozen_string_literal: true

class AddLanguageToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :language, :string
  end
end
