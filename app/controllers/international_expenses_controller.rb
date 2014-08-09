class InternationalExpensesController < ApplicationController
  before_action :set_international_expense, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :user_activated

  # GET /international_expenses
  # GET /international_expenses.json
  def index
    @international_expenses = InternationalExpense.all
    @p_international_expenses       = @international_expenses.paginate(:page => params[:page], :per_page => 8).order('id ASC')
  end

  # GET /international_expenses/1
  # GET /international_expenses/1.json
  def show
  end

  # GET /international_expenses/new
  def new
    @international_expense = InternationalExpense.new
  end

  # GET /international_expenses/1/edit
  def edit
  end

  # POST /international_expenses
  # POST /international_expenses.json
  def create
    @international_expense = InternationalExpense.new(expense_params)

    respond_to do |format|
      if @international_expense.save
        format.html { redirect_to international_expenses_url, notice: 'Expense was successfully created.' }
        format.json { render action: 'show', status: :created, location: @international_expense }
      else
        format.html { render action: 'new' }
        format.json { render json: @international_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /international_expenses/1
  # PATCH/PUT /international_expenses/1.json
  def update
    respond_to do |format|
      if @international_expense.update(international_expense_params)
        format.html { redirect_to international_expenses_url, notice: 'Expense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @international_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /international_expenses/1
  # DELETE /international_expenses/1.json
  def destroy
    @international_expense.destroy
    respond_to do |format|
      format.html { redirect_to international_expenses_url, flash: {success: 'Expense was successfully deleted.'} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_international_expense
      @international_expense = InternationalExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def international_expense_params
      params.require(:international_expense).permit(:number, :date, :description, :value, :supplier_id, :file, :file_cache)
    end
end
