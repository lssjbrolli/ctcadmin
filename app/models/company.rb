# frozen_string_literal: true

class Company < ActiveRecord::Base
  before_create :find_company

  has_many :credit_invoices
  has_many :national_expenses
  has_many :extern_expenses
  belongs_to :created_by, foreign_key: 'create_id', class_name: 'User', optional: true
  belongs_to :updated_by, foreign_key: 'update_id', class_name: 'User', optional: true

  private

  def find_company
    if country == 'RO'
      national
    else
      international
    end
  end

  def national
    response = HTTParty.get("http://openapi.ro/api/companies/#{vat}.json")

    if response.code == 200
      self.name = response['name']
      self.registration = response['registration_id']
      self.vat = if response['vat'] == '1'
                   "RO#{response['cif']}"
                 else
                   response['cif']
                 end
      self.address = "#{response['address']}, #{response['city']}, #{response['zip']}, #{response['state']}, Romania"
      self.phone = response['phone']
      self.vies_valid = Valvat::Lookup.validate(vat.to_s)
    else
      self.name = '#'
    end
    nil
  end

  def international
    company = if country == 'GR'
                Valvat.new("EL#{vat}").exists?(detail: true)
              else
                Valvat.new("#{country}#{vat}").exists?(detail: true)
              end

    if company == false || company.nil? || company[:name].nil? || company[:address].nil?
      self.name = '#'
    else
      self.name = company[:name].titleize
      self.vat = "EL#{vat}" if country == 'GR'
      self.address = company[:address]
      self.vies_valid = true
    end
  end
end
