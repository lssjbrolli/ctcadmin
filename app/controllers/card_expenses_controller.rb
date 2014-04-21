class CardExpensesController < ApplicationController
  before_action :set_card_expense, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :user_activated

  # GET /card_expenses
  # GET /card_expenses.json
  def index
    @card_expenses = CardExpense.all
    @p_card_expenses = @card_expenses.paginate(:page => params[:page], :per_page => 10).order('id ASC')
  end

  # GET /card_expenses/1
  # GET /card_expenses/1.json
  def show
  end

  # GET /card_expenses/new
  def new
    @card_expense = CardExpense.new
  end

  # GET /card_expenses/1/edit
  def edit
  end

  # POST /card_expenses
  # POST /card_expenses.json
  def create
    @card_expense = CardExpense.new(card_expense_params)

    respond_to do |format|
      if @card_expense.save
        format.html { redirect_to card_expenses_url, flash: { success: 'Expense was successfully created.' }}
        format.json { render action: 'show', status: :created, location: @card_expense }
      else
        format.html { render action: 'new' }
        format.json { render json: @card_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_expenses/1
  # PATCH/PUT /card_expenses/1.json
  def update
    respond_to do |format|
      if @card_expense.update(card_expense_params)
        format.html { redirect_to @card_expense, notice: 'Card expense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @card_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_expenses/1
  # DELETE /card_expenses/1.json
  def destroy
    @card_expense.destroy
    respond_to do |format|
      format.html { redirect_to card_expenses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_expense
      @card_expense = CardExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_expense_params
      params.require(:card_expense).permit( :currency, :number, :date, :value, :description, :eur_value, :file, :file_cache )
    end
end
