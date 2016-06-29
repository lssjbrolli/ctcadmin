class OrdersController < ApplicationController
  include UserInfo

  before_action :signed_in_user
  before_action :user_activated

  def new
    @order = Order.new
    @payment = Payment.find(params[:id])
  end

  def show
  end

  def create
    @payment = Payment.find(params[:payment])

    if @payment.order.nil?
      @order = Order.new
    else
      @order = @payment.order
    end

    pdf = GenOrderPdf.new(params, @order.id)
    src = File.join(Rails.root, 'tmp/tmp.pdf')
    pdf.render_file src
    src_file = File.new(src)

    @order.update_attribute('payment_id', @payment.id)
    @order.attachments.new(file: File.open(src_file))

    respond_to do |format|
      if @order.save
        @payment.update_column('updated', 'false')
        format.html { redirect_to employee_payments_url(@payment.employee), flash: {success: 'Order was successfully created.'} }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:payment_id)
  end
end
