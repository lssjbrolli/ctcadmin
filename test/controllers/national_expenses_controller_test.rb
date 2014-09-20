require 'test_helper'

class NationalExpensesControllerTest < ActionController::TestCase
	setup do
		@national_expense = national_expenses(:one)
	end

	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:national_expenses)
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should create national_expense" do
		assert_difference('NationalExpense.count') do
			post :create, national_expense: {}
		end

		assert_redirected_to national_expense_path(assigns(:national_expense))
	end

	test "should show national_expense" do
		get :show, id: @national_expense
		assert_response :success
	end

	test "should get edit" do
		get :edit, id: @national_expense
		assert_response :success
	end

	test "should update national_expense" do
		patch :update, id: @national_expense, national_expense: {}
		assert_redirected_to national_expense_path(assigns(:national_expense))
	end

	test "should destroy national_expense" do
		assert_difference('NationalExpense.count', -1) do
			delete :destroy, id: @national_expense
		end

		assert_redirected_to national_expenses_path
	end
end
