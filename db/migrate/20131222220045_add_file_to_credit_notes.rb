class AddFileToCreditNotes < ActiveRecord::Migration
  def change
    add_column :credit_notes, :file, :string
  end
end
