class ChangeCreditNoteNumberToString < ActiveRecord::Migration
  def change
  	change_column :credit_notes, :number, :string
  end
end
