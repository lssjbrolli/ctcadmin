class CreditInvoice < ActiveRecord::Base

  before_save :set_number, :set_total, :set_paid
  after_create :make_pdf
  after_update :make_pdf

  belongs_to :client, :foreign_key => 'client_id', :class_name => 'Company'
  belongs_to :created_by, :foreign_key => 'create_id', :class_name => 'User'
  belongs_to :updated_by, :foreign_key => 'update_id', :class_name => 'User'

  has_many :credit_notes
  has_many :attachments, :as => :attachable

  accepts_nested_attributes_for :attachments, allow_destroy: true

  validates :client, :credit_note_ids, :tax_rate, :currency, presence: true

  protected

  def set_number
    if self.number.empty?
      if CreditInvoice.last.nil?
        self.number = 1
      else
        self.number = CreditInvoice.last.number.next
      end
    end
  end

  def set_total
    self.net_value = 0
    self.credit_notes.map do |cn|
      self.net_value += cn.value
    end
    if self.tax_rate == 'taxare inversa'
      self.total_value = self.net_value
    else
      tax = self.tax_rate.split('%')[0].to_f/100
      self.tax_value = self.net_value * tax
      self.total_value = self.net_value + self.tax_value
    end
  end

  def set_paid
    self.credit_note_ids.each do |cn|
      CreditNote.find(cn).update_attribute(:paid, true)
    end
  end

  def make_pdf
    logger.info 'we make invoice'
    pdf = CreditInvoicePdf.new(self, ActionController::Base.helpers)
    byebug
    src = File.join(Rails.root, 'tmp/tmp.pdf')
    byebug
    pdf.render_file src
    byebug
    src_file = File.new(src)
    byebug
    self.attachments.new(file: File.open(src_file))
  end

end
