# frozen_string_literal: true

class MonetizePayments < ActiveRecord::Migration[5.2]
  def change
    change_table :payments do |t|
      t.monetize :salar_ron, amount: { null: true, default: nil }, currency: { present: :ron }
      t.monetize :salar_eur, amount: { null: true, default: nil }, currency: { present: :eur }
      t.monetize :avans, amount: { null: true, default: nil }, currency: { present: :eur }
      t.monetize :rest, amount: { null: true, default: nil }, currency: { present: :eur }
      t.monetize :total, amount: { null: true, default: nil }, currency: { present: :eur }
    end
  end
end
