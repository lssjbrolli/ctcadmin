class Payment < ActiveRecord::Base
	monetize :salar_ron, :salar_eur, :avans, :rest
	
	belongs_to :employee
end
