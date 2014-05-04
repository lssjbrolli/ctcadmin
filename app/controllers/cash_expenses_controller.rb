class CashExpensesController < ApplicationController
  before_action :set_cash_expense, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :user_activated

  # GET /cash_expenses
  # GET /cash_expenses.json
  def index
    @cash_expenses = CashExpense.all
    @p_cash_expenses = @cash_expenses.paginate(:page => params[:page], :per_page => 8).order('id ASC')
    @cash_expenses_missing =  CashExpense.where(raport: false)
  end

  # GET /cash_expenses/1
  # GET /cash_expenses/1.json
  def show
  end

  # GET /cash_expenses/new
  def new
    @cash_expense = CashExpense.new
  end

  # GET /cash_expenses/1/edit
  def edit
  end

  # POST /cash_expenses
  # POST /cash_expenses.json
  def create
    @cash_expense = CashExpense.new(cash_expense_params)

    respond_to do |format|
      if @cash_expense.save
        format.html { redirect_to cash_expenses_url, flash: { success: 'Expense was successfully created.' }}
        format.json { render action: 'show', status: :created, location: @cash_expense }
      else
        format.html { render action: 'new' }
        format.json { render json: @cash_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_expenses/1
  # PATCH/PUT /cash_expenses/1.json
  def update
    respond_to do |format|
      if @cash_expense.update(cash_expense_params)
        format.html { redirect_to cash_expenses_path, flash: { success: 'Expense was successfully updated.' }}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cash_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_expenses/1
  # DELETE /cash_expenses/1.json
  def destroy
    @cash_expense.destroy
    respond_to do |format|
      format.html { redirect_to cash_expenses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_expense
      @cash_expense = CashExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cash_expense_params
      params.require(:cash_expense).permit( :currency, :number, :date, :value, :description, :file, :file_cache )
    end
end
