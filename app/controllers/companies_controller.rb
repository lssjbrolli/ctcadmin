class CompaniesController < ApplicationController
  include UserInfo

  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :user_activated

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all.paginate(:page => params[:page], :per_page => 8).order('name ASC')
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    on_create(@company)
    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_url, flash: {success: 'Company was successfully created.'} }
        format.json { render action: 'show', status: :created, location: @company }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    on_update(@company)
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to companies_url, flash: {success: 'Company was successfully updated.'} }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, flash: {success: 'Company was successfully deleted.'} }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def company_params
    params.require(:company).permit(:name, :registration, :vat, :address, :acc_lei, :acc_eur, :bank, :capital, :phone)
  end
end
