class ChangeInternalToNumber < ActiveRecord::Migration
  def change
    # noinspection RailsParamDefResolve
    rename_column :expenses, :invoice_number, :number
  end
end
