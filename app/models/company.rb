class Company < ActiveRecord::Base
  before_create :find_company
  
  has_many :credit_invoices
  has_many :national_expenses
  has_many :extern_expenses
  belongs_to :created_by, :foreign_key => 'create_id', :class_name => 'User'
  belongs_to :updated_by, :foreign_key => 'update_id', :class_name => 'User'

  private

  def find_company
    if self.country == 'RO'
      national
    else
      international
    end

  end

  def national
    response = HTTParty.get("http://openapi.ro/api/companies/#{self.vat}.json")

    if response.code == 200
      self.name = response['name']
      self.registration = response['registration_id']
      if response['vat'] == '1'
        self.vat = "RO#{response['cif']}"
      else
        self.vat = response['cif']
      end
      self.address = "#{response['address']}, #{response['city']}, #{response['zip']}, #{response['state']}, Romania"
      self.phone = response['phone']
      self.vies_valid = Valvat::Lookup.validate("#{self.vat}")
    else
      self.name = '#'
    end
    nil
  end

  def international
    if self.country == 'GR'
      company = Valvat.new("EL#{self.vat}").exists?(:detail => true)
    else
      company = Valvat.new("#{self.country}#{self.vat}").exists?(:detail => true)
    end

    if company == false || company.nil?
      self.name = '#'
    else
      self.name = company[:name].titleize
      if self.country == 'GR'
        self.vat = "EL#{self.vat}"
      end
      self.address = company[:address]
      self.vies_valid = true
      end
  end

end


