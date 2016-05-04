class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.string :km
      t.text :comment

      t.timestamps
    end
  end
end
