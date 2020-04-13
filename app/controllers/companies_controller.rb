# frozen_string_literal: true

class CompaniesController < ApplicationController
  include UserInfo

  before_action :set_company, only: %i[show edit update destroy]
  before_action :signed_in_user
  before_action :user_activated

  # GET /companies
  # GET /companies.json
  def index
    @q = Company.ransack(params[:q])
    @companies = @q.result(distinct: true)
                   .paginate(page: params[:page], per_page: 8)
                   .order('name ASC')
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
  def edit; end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    on_create(@company)
    respond_to do |format|
      if @company.save
        format.html do
          redirect_to companies_url,
                      flash: { success: 'Company was successfully created.' }
        end
        format.json do
          render action: 'show',
                 status: :created, location: @company
        end
      else
        format.html { render action: 'new' }
        format.json do
          render json: @company.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    on_update(@company)
    respond_to do |format|
      if @company.update(company_params)
        format.html do
          redirect_to companies_url,
                      flash: { success: 'Company was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json do
          render json: @company.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html do
        redirect_to companies_url,
                    flash: { success: 'Company was successfully deleted.' }
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def company_params
    params.require(:company).permit(
      :name, :registration, :vat, :country,
      :vies_valid, :address, :acc_ron,
      :acc_eur, :bank, :capital, :phone
    )
  end
end
