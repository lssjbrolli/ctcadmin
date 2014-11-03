class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :description
      t.date :expire

      t.timestamps
    end
  end
end
