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
		@order = Order.new

		pdf = GenOrderPdf.new(params)
		src = File.join(Rails.root, 'tmp/tmp.pdf')
		pdf.render_file src
		src_file = File.new(src)
		
		@order.update_attribute("payment_id", @payment.id)
		@order.attachments.new(file: File.open(src_file))

		respond_to do |format|
			if @order.save
				format.html { redirect_to employee_payments_url(@payment.employee), flash: {success: 'Order was successfully created.'} }
			else
				format.html { render action: 'new' }
			end
		end
	end

	private

	# Never trust parameters from the scary internet, only allow the white list through.
	def order_params
		params.require(:order).permit()
	end
end
