class CreateCreditNotes < ActiveRecord::Migration[4.2]
  def change
    create_table :credit_notes do |t|

      t.timestamps
    end
  end
end
