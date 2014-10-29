class ExternExpensesController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :set_extern_expense, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :user_activated
  before_filter :format_date_time, :only => [:create, :update]

  # GET /extern_expenses
  # GET /extern_expenses.json
  def index
    @extern_expenses = ExternExpense.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 8)
  end

  # GET /extern_expenses/1
  # GET /extern_expenses/1.json
  def show
  end

  # GET /extern_expenses/new
  def new
    @extern_expense = ExternExpense.new
  end

  # GET /extern_expenses/1/edit
  def edit
  end

  # POST /extern_expenses
  # POST /extern_expenses.json
  def create
    @extern_expense = ExternExpense.new(extern_expense_params)
    logger.debug "Create: #{extern_expense_params}"
    respond_to do |format|
      if @extern_expense.save
        format.html { redirect_to extern_expenses_url, success: 'Expense was successfully created.' }
        format.json { render action: 'show', status: :created, location: @extern_expense }
      else
        format.html { render action: 'new' }
        format.json { render json: @extern_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extern_expenses/1
  # PATCH/PUT /extern_expenses/1.json
  def update
    logger.debug "Update: #{extern_expense_params}"
    respond_to do |format|
      if @extern_expense.update(extern_expense_params)
        format.html { redirect_to extern_expenses_url, success: 'Expense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @extern_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extern_expenses/1
  # DELETE /extern_expenses/1.json
  def destroy
    @extern_expense.destroy
    respond_to do |format|
      format.html { redirect_to extern_expenses_url, flash: {success: 'Expense was successfully deleted.'} }
      format.json { head :no_content }
    end
  end

  private
  def format_date_time
    date = extern_expense_params['date']
    parse = Date.parse(date)
    params["extern_expense"]["date"] = parse
  end

  def sort_column
    %w[number value supplier_id].include?(params[:sort]) ? params[:sort] : 'number'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_extern_expense
    @extern_expense = ExternExpense.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def extern_expense_params
    params.require(:extern_expense).permit(:number, :date, :description, :value, :currency, :supplier_id, attachments_attributes: [:id, :file, :_destroy, :file_cache])
  end
end
