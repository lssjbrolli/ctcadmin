class Company < ActiveRecord::Base
  before_save :find_company
  
  has_many :credit_invoices
  has_many :national_expenses
  has_many :extern_expenses
  belongs_to :created_by, :foreign_key => 'create_id', :class_name => 'User'
  belongs_to :updated_by, :foreign_key => 'update_id', :class_name => 'User'

  private

  def find_company
    #TO DO rescue if bad connection
    response = HTTParty.get("http://openapi.ro/api/companies/#{self.vat}.json")

    if response.code == 200
      self.name = response['name']
      self.registration = response['registration_id']
      if response['vat'] == 1
        self.vat = "RO#{response['cif']}"
      else
        self.vat = response['cif']
      end
      self.address = "#{response['address']}, #{response['city']}, #{response['zip']}, #{response['state']}, Romania"
      self.phone = response['phone']
    end

  end

end