# frozen_string_literal: true

# RailsSettings Model
class SiteConfig < RailsSettings::Base
  scope :main do
    field :diurna_zi, default: 0, type: :integer
    field :activities, default: [], type: :array
    field :vat_rate, default: [], type: :array
    field :currencies, default: [], type: :array
    field :paid_by, default: [], type: :array
    field :salar_baza, default: 0, type: :integer
  end

  scope :company do
    field :company_name, default: '', type: :string
    field :registration, default: '', type: :string
    field :vat, default: '', type: :string
    field :address, default: '', type: :string
    field :acc_ron, default: '', type: :string
    field :acc_eur, default: '', type: :string
    field :bank, default: '', type: :string
    field :capital, default: '', type: :string
    field :phone, default: '', type: :string
    field :email, default: '', type: :string
    field :contact, default: '', type: :string
  end
end
