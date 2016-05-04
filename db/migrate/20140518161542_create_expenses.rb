class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :number
      t.date :date
      t.text :description
      t.decimal :value, precision: 8, scale: 2
      t.decimal :value_ron

      t.timestamps
    end
  end
end
