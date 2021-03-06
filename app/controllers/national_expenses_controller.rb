# frozen_string_literal: true

class NationalExpensesController < ApplicationController
  include UserInfo

  before_action :set_national_expense, only: %i[show edit update destroy]
  before_action :set_companies_list, only: %i[new edit create]
  before_action :signed_in_user
  before_action :user_activated

  # GET /national_expenses
  # GET /national_expenses.json
  def index
    @q = NationalExpense.ransack(params[:q])
    @national_expenses = @q.result(distinct: true).includes(:supplier).paginate(page: params[:page], per_page: 8)
  end

  # GET /national_expenses/1
  # GET /national_expenses/1.json
  def show; end

  # GET /national_expenses/new
  def new
    @national_expense = NationalExpense.new
  end

  # GET /national_expenses/1/edit
  def edit; end

  # POST /national_expenses
  # POST /national_expenses.json
  def create
    @national_expense = NationalExpense.new(national_expense_params)
    on_create(@national_expense)
    respond_to do |format|
      if @national_expense.save
        format.html { redirect_to national_expenses_url, flash: { success: 'Expense was successfully created.' } }
        format.json { render action: 'show', status: :created, location: @national_expense }
      else
        format.html { render action: 'new' }
        format.json { render json: @national_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /national_expenses/1
  # PATCH/PUT /national_expenses/1.json
  def update
    on_update(@national_expense)
    respond_to do |format|
      if @national_expense.update(national_expense_params)
        format.html { redirect_to national_expenses_path, flash: { success: 'Expense was successfully updated.' } }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @national_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /national_expenses/1
  # DELETE /national_expenses/1.json
  def destroy
    @national_expense.destroy
    respond_to do |format|
      format.html { redirect_to national_expenses_url, flash: { success: 'Expense was successfully deleted.' } }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_national_expense
    @national_expense = NationalExpense.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def national_expense_params
    params.require(:national_expense).permit(:currency, :number, :date, :value, :description, :supplier_id, :paid_by, attachments_attributes: %i[id file _destroy])
  end

  def set_companies_list
    @companies = Company.order('name ASC')
  end
end
