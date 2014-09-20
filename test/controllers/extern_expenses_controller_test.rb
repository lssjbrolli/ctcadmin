require 'test_helper'

class ExternExpensesControllerTest < ActionController::TestCase
	setup do
		@extern_expense = extern_expenses(:one)
	end

	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:extern_expenses)
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should create extern_expense" do
		assert_difference('ExternExpense.count') do
			post :create, extern_expense: {}
		end

		assert_redirected_to extern_expense_path(assigns(:extern_expense))
	end

	test "should show extern_expense" do
		get :show, id: @extern_expense
		assert_response :success
	end

	test "should get edit" do
		get :edit, id: @extern_expense
		assert_response :success
	end

	test "should update extern_expense" do
		patch :update, id: @extern_expense, extern_expense: {}
		assert_redirected_to extern_expense_path(assigns(:extern_expense))
	end

	test "should destroy extern_expense" do
		assert_difference('ExternExpense.count', -1) do
			delete :destroy, id: @extern_expense
		end

		assert_redirected_to extern_expenses_path
	end
end
