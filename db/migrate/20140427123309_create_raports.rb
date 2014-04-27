class CreateRaports < ActiveRecord::Migration
  def change
    create_table :raports do |t|
    	t.string :name
    	t.string :file
      t.timestamps
    end
  end
end
