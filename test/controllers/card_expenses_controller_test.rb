require 'test_helper'

class CardExpensesControllerTest < ActionController::TestCase
	setup do
		@card_expense = card_expenses(:one)
	end

	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:card_expenses)
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should create card_expense" do
		assert_difference('CardExpense.count') do
			post :create, card_expense: {}
		end

		assert_redirected_to card_expense_path(assigns(:card_expense))
	end

	test "should show card_expense" do
		get :show, id: @card_expense
		assert_response :success
	end

	test "should get edit" do
		get :edit, id: @card_expense
		assert_response :success
	end

	test "should update card_expense" do
		patch :update, id: @card_expense, card_expense: {}
		assert_redirected_to card_expense_path(assigns(:card_expense))
	end

	test "should destroy card_expense" do
		assert_difference('CardExpense.count', -1) do
			delete :destroy, id: @card_expense
		end

		assert_redirected_to card_expenses_path
	end
end
