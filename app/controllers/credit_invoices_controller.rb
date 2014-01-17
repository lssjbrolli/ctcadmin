class CreditInvoicesController < ApplicationController
  before_action :set_credit_invoice, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  # GET /credit_invoices
  # GET /credit_invoices.json
  def index
    @credit_invoices = CreditInvoice.all
    @cinvoices = @credit_invoices.paginate(:page => params[:page], :per_page => 10).order('number ASC')
  end

  # GET /credit_invoices/1
  # GET /credit_invoices/1.json
  def show
    @invoice = CreditInvoice.find(params[:id])
    respond_to do |format|
      format.pdf do 
        pdf = CreditInvoicePdf.new(@invoice, view_context)
        send_data pdf.render, filename: "#{@invoice.number}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
       end
    end
  end

  # GET /credit_invoices/new
  def new
    @credit_invoice = CreditInvoice.new
    @companies = Company.all
    @cnotes = CreditNote.all.where(paid: false).order('number ASC')
  end

  # GET /credit_invoices/1/edit
  def edit
    @cnotes = CreditInvoice.find(params[:id]).credit_notes + CreditNote.all.where(paid: false).order('number ASC')
    @companies = Company.all
  end

  # POST /credit_invoices
  # POST /credit_invoices.json
  def create
    @credit_invoice = CreditInvoice.new(credit_invoice_params)
    @credit_invoice.update_attributes(user_id: @current_user.id)

    respond_to do |format|
      if @credit_invoice.save
        format.html { redirect_to credit_invoices_path, notice: 'Credit invoice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @credit_invoice }
      else
        format.html { render action: 'new' }
        format.json { render json: @credit_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_invoices/1
  # PATCH/PUT /credit_invoices/1.json
  def update
    respond_to do |format|
      if @credit_invoice.update(credit_invoice_params)
        format.html { redirect_to credit_invoices_path, notice: 'Credit invoice was successfully updated.' }
        format.json { respond_with_bip(@debit_invoice) }
      else
        format.html { render action: 'edit' }
        format.json { render json: @credit_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_invoices/1
  # DELETE /credit_invoices/1.json
  def destroy
    @credit_invoice.destroy
    respond_to do |format|
      format.html { redirect_to credit_invoices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_invoice
      @credit_invoice = CreditInvoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_invoice_params
      params.require(:credit_invoice).permit(:number, :date, :seller_id, :buyer_id, :currency, :tax_rate, :delegat, :ci, :eliberat, :transport, {:credit_note_ids => []} )
    end
end
