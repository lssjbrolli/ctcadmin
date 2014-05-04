require 'test_helper'

class DebitInvoicesControllerTest < ActionController::TestCase
	setup do
		@debit_invoice = debit_invoices(:one)
	end

	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:debit_invoices)
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should create debit_invoice" do
		assert_difference('DebitInvoice.count') do
			post :create, debit_invoice: {}
		end

		assert_redirected_to debit_invoice_path(assigns(:debit_invoice))
	end

	test "should show debit_invoice" do
		get :show, id: @debit_invoice
		assert_response :success
	end

	test "should get edit" do
		get :edit, id: @debit_invoice
		assert_response :success
	end

	test "should update debit_invoice" do
		patch :update, id: @debit_invoice, debit_invoice: {}
		assert_redirected_to debit_invoice_path(assigns(:debit_invoice))
	end

	test "should destroy debit_invoice" do
		assert_difference('DebitInvoice.count', -1) do
			delete :destroy, id: @debit_invoice
		end

		assert_redirected_to debit_invoices_path
	end
end
