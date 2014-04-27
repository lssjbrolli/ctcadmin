class RaportsController < ApplicationController
  before_action :set_raport, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :user_activated

  # GET /raports
  # GET /raports.json
  def index
    @raports = Raport.all
  end

  # GET /raports/1
  # GET /raports/1.json
  def show
    @raport = Raport.find(params[:id])
    respond_to do |format|
      format.pdf do 
        pdf = RaportPdf.new(@raport, view_context)
        send_data pdf.render, filename: "#{@raport.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
       end
    end
  end

  # GET /raports/new
  def new
    @raport = Raport.new
    @card_expenses = CardExpense.all.where(raport: false)
  end

  # GET /raports/1/edit
  def edit
	@companies = Company.all
  end

  # POST /raports
  # POST /raports.json
  def create
    @raport = Raport.new(raport_params)

    respond_to do |format|
      if @raport.save
        format.html { redirect_to raports_path, flash: { success: 'Credit invoice was successfully created.' }}
        format.json { render action: 'show', status: :created, location: @raport }
      else
        format.html { render action: 'new' }
        format.json { render json: @raport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raports/1
  # PATCH/PUT /raports/1.json
  def update
    respond_to do |format|
      if @raport.update(raport_params)
        format.html { redirect_to raports_path, flash: { success: 'Credit invoice was successfully updated.' }}
        format.json { respond_with_bip(@debit_invoice) }
      else
        format.html { render action: 'edit' }
        format.json { render json: @raport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raports/1
  # DELETE /raports/1.json
  def destroy
    @raport.destroy
    respond_to do |format|
      format.html { redirect_to raports_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raport
      @raport = Raport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raport_params
      params.require(:raport).permit({:raport_ids => []} )
    end
end
