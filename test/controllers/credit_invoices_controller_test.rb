require 'test_helper'

class CreditInvoicesControllerTest < ActionController::TestCase
  setup do
    @credit_invoice = credit_invoices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:credit_invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create credit_invoice" do
    assert_difference('CreditInvoice.count') do
      post :create, credit_invoice: {}
    end

    assert_redirected_to credit_invoice_path(assigns(:credit_invoice))
  end

  test "should show credit_invoice" do
    get :show, id: @credit_invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @credit_invoice
    assert_response :success
  end

  test "should update credit_invoice" do
    patch :update, id: @credit_invoice, credit_invoice: {}
    assert_redirected_to credit_invoice_path(assigns(:credit_invoice))
  end

  test "should destroy credit_invoice" do
    assert_difference('CreditInvoice.count', -1) do
      delete :destroy, id: @credit_invoice
    end

    assert_redirected_to credit_invoices_path
  end
end
