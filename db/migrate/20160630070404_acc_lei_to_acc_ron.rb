class AccLeiToAccRon < ActiveRecord::Migration
  def change
    rename_column :companies, :acc_lei, :acc_ron
  end
end
