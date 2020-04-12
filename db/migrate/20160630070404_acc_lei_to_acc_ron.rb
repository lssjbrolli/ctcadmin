# frozen_string_literal: true

class AccLeiToAccRon < ActiveRecord::Migration[4.2]
  def change
    rename_column :companies, :acc_lei, :acc_ron
  end
end
