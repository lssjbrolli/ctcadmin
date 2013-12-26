class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
	  t.string :name
  	  t.string :registration
  	  t.string :vat
  	  t.text :address
  	  t.string :acc_lei
  	  t.string :acc_eur
  	  t.string :bank
  	  t.string :capital
  	  t.string :phone
      t.timestamps
    end
  end
end
