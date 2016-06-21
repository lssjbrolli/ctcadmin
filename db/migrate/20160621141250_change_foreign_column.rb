class ChangeForeignColumn < ActiveRecord::Migration
  def change
    change_column :companies, :foreign, :string
  end
end
