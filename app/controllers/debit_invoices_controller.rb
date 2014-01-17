class DebitInvoicesController < ApplicationController
  before_action :set_debit_invoice, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  # GET /debit_invoices
  # GET /debit_invoices.json
  def index
    @debit_invoices = DebitInvoice.all
    @dinvoices = @debit_invoices.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /debit_invoices/1
  # GET /debit_invoices/1.json
  def show
  end

  # GET /debit_invoices/new
  def new
    @debit_invoice = DebitInvoice.new
  end

  # GET /debit_invoices/1/edit
  def edit
  end

  # POST /debit_invoices
  # POST /debit_invoices.json
  def create
    @debit_invoice = DebitInvoice.new(debit_invoice_params)

    respond_to do |format|
      if @debit_invoice.save
        format.html { redirect_to @debit_invoice, notice: 'Debit invoice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @debit_invoice }
      else
        format.html { render action: 'new' }
        format.json { render json: @debit_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debit_invoices/1
  # PATCH/PUT /debit_invoices/1.json
  def update
    respond_to do |format|
      if @debit_invoice.update(debit_invoice_params)
        format.html { redirect_to @debit_invoice, notice: 'Debit invoice was successfully updated.' }
        format.json { respond_with_bip(@debit_invoice) }
      else
        format.html { render action: 'edit' }
        format.json { render json: @debit_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debit_invoices/1
  # DELETE /debit_invoices/1.json
  def destroy
    @debit_invoice.destroy
    respond_to do |format|
      format.html { redirect_to debit_invoices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debit_invoice
      @debit_invoice = DebitInvoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debit_invoice_params
      params[:debit_invoice]
    end
end
