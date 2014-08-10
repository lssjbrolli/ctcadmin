class TripExpensesController < ApplicationController
	helper_method :sort_column, :sort_direction

	before_action :set_trip_expense, only: [:show, :edit, :update, :destroy]
	before_action :signed_in_user
	before_action :user_activated

	# GET /trip_expenses
	# GET /trip_expenses.json
	def index
		@trip_expenses_missing = TripExpense.where(raport: false)
		@trip_expenses         = TripExpense.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 8)
	end

	# GET /trip_expenses/1
	# GET /trip_expenses/1.json
	def show
	end

	# GET /trip_expenses/new
	def new
		@trip_expense = TripExpense.new
	end

	# GET /trip_expenses/1/edit
	def edit
	end

	# POST /trip_expenses
	# POST /trip_expenses.json
	def create
		@trip_expense = TripExpense.new(trip_expense_params)

		respond_to do |format|
			if @trip_expense.save
				format.html { redirect_to trip_expenses_url, flash: {success: 'Expense was successfully created.'} }
				format.json { render action: 'show', status: :created, location: @trip_expense }
			else
				format.html { render action: 'new' }
				format.json { render json: @trip_expense.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /trip_expenses/1
	# PATCH/PUT /trip_expenses/1.json
	def update
		respond_to do |format|
			if @trip_expense.update(trip_expense_params)
				format.html { redirect_to trip_expenses_path, flash: {success: 'Expense was successfully updated.'} }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @trip_expense.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /trip_expenses/1
	# DELETE /trip_expenses/1.json
	def destroy
		@trip_expense.destroy
		respond_to do |format|
			format.html { redirect_to trip_expenses_url, flash: {success: 'Expense was successfully deleted.'} }
			format.json { head :no_content }
		end
	end

	private

	# Sortable methods
	def sort_column
		%w[int_id value value_eur card].include?(params[:sort]) ? params[:sort] : 'int_id'
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
	end

	# Use callbacks to share common setup or constraints between actions.
	def set_trip_expense
		@trip_expense = TripExpense.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def trip_expense_params
		params.require(:trip_expense).permit(:currency, :number, :date, :value, :description, :value_eur, :file, :file_cache, :int_id, :card)
	end
end
