require 'test_helper'

class TripExpensesControllerTest < ActionController::TestCase
	setup do
		@trip_expense = trip_expenses(:one)
	end

	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:trip_expenses)
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should create trip_expense" do
		assert_difference('TripExpense.count') do
			post :create, trip_expense: {}
		end

		assert_redirected_to trip_expense_path(assigns(:trip_expense))
	end

	test "should show trip_expense" do
		get :show, id: @trip_expense
		assert_response :success
	end

	test "should get edit" do
		get :edit, id: @trip_expense
		assert_response :success
	end

	test "should update trip_expense" do
		patch :update, id: @trip_expense, trip_expense: {}
		assert_redirected_to trip_expense_path(assigns(:trip_expense))
	end

	test "should destroy expense" do
		assert_difference('TripExpense.count', -1) do
			delete :destroy, id: @trip_expense
		end

		assert_redirected_to trip_expenses_path
	end
end
