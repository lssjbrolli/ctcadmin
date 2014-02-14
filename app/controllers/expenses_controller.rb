class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :user_activated

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.all
    @pexpenses = @expenses.paginate(:page => params[:page], :per_page => 10).order('id ASC')
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_url, flash: { success: 'Expense was successfully created.' }}
        format.json { render action: 'show', status: :created, location: @expense }
      else
        format.html { render action: 'new' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expenses_url, flash: { success: 'Expense was successfully updated.' }}
        format.json { respond_with_bip(@expense) }
      else
        format.html { render action: 'edit' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit( :currency, :number, :date, :value, :comment, :ron_value, :card, :supplier_id, :file, :file_cache )
    end
end
