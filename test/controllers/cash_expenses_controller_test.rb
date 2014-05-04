require 'test_helper'

class CashExpensesControllerTest < ActionController::TestCase
  setup do
    @cash_expense = cash_expenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cash_expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cash_expense" do
    assert_difference('CashExpense.count') do
      post :create, cash_expense: {  }
    end

    assert_redirected_to cash_expense_path(assigns(:cash_expense))
  end

  test "should show cash_expense" do
    get :show, id: @cash_expense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cash_expense
    assert_response :success
  end

  test "should update cash_expense" do
    patch :update, id: @cash_expense, cash_expense: {  }
    assert_redirected_to cash_expense_path(assigns(:cash_expense))
  end

  test "should destroy cash_expense" do
    assert_difference('CashExpense.count', -1) do
      delete :destroy, id: @cash_expense
    end

    assert_redirected_to cash_expenses_path
  end
end
