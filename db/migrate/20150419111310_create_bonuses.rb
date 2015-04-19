class CreateBonuses < ActiveRecord::Migration
  def change
    create_table :bonuses do |t|
      t.string :value
      t.string :comment
      t.integer :payment_id
      t.timestamps
    end
  end
end
