# frozen_string_literal: true

class TripExpensesController < ApplicationController
  include UserInfo

  before_action :set_trip_expense, only: %i[show edit update destroy]
  before_action :signed_in_user
  before_action :user_activated

  # GET /trip_expenses
  # GET /trip_expenses.json
  def index
    @trip_expenses_missing = TripExpense.missing
    @q = TripExpense.ransack(params[:q])
    @trip_expenses = @q.result.order('intnr::int desc')
                       .paginate(page: params[:page], per_page: 8)
  end

  # GET /trip_expenses/1
  # GET /trip_expenses/1.json
  def show; end

  # GET /trip_expenses/new
  def new
    @trip_expense = TripExpense.new
  end

  # GET /trip_expenses/1/edit
  def edit; end

  # POST /trip_expenses
  # POST /trip_expenses.json
  def create
    @trip_expense = TripExpense.new(trip_expense_params)
    on_create(@trip_expense)
    respond_to do |format|
      if @trip_expense.save
        format.html do
          redirect_to trip_expenses_url,
                      flash: { success: 'Expense was successfully created.' }
        end
        format.json do
          render action: 'show',
                 status: :created,
                 location: @trip_expense
        end
      else
        format.html { render action: 'new' }
        format.json do
          render json: @trip_expense.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /trip_expenses/1
  # PATCH/PUT /trip_expenses/1.json
  def update
    on_update(@trip_expense)
    respond_to do |format|
      if @trip_expense.update(trip_expense_params)
        format.html do
          redirect_to trip_expenses_path,
                      flash: { success: 'Expense was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json do
          render json: @trip_expense.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /trip_expenses/1
  # DELETE /trip_expenses/1.json
  def destroy
    @trip_expense.destroy
    respond_to do |format|
      format.html do
        redirect_to trip_expenses_url,
                    flash: { success: 'Expense was successfully deleted.' }
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trip_expense
    @trip_expense = TripExpense.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def trip_expense_params
    params.require(:trip_expense).permit(
      :currency, :number, :date, :value, :description,
      :value_eur, :intnr, :card,
      attachments_attributes: %i[id file file_cache _destroy]
    )
  end
end
