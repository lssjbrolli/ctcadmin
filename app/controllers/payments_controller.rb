class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :user_activated
  before_action :set_employee, except: [:edit, :bonus]
  before_filter :format_date_time, :only => [:create, :update]

  # GET /payments
  # GET /payments.json
  def index
    @payments = @employee.payments.paginate(:page => params[:page], :per_page => 8).order('month DESC')
  end

  def bonus
    @bonus = Payment.find(params[:id])
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = Payment.find(params[:id])
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
    @employee = @payment.employee
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = @employee.payments.build
    @payment.update_attributes(payment_params)
    respond_to do |format|
      if @payment.save
        format.html { redirect_to employee_payments_path(@employee), flash: {success: 'Payment was successfully created.'} }
        format.json { render action: 'show', status: :created, location: @payment }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to employee_payments_path(@employee), flash: {success: 'Payment was successfully updated.'} }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to employee_payments_path(@employee), flash: {success: 'Payment was successfully deleted.'} }
    end
  end

  private

  #get the specific employee
  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def format_date_time
    date = payment_params['month']
    parse = Date.parse(date)
    params['payment']['month'] = parse
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def payment_params
    params.require(:payment).permit(:sron, :month, :avans, :diurna, :days, bonuses_attributes: [:id, :value, :comment, :_destroy])
  end
end
