class AddForeignBooleanToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :foreign, :boolean, default: false
  end
end
