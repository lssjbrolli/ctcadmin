class RaportsController < ApplicationController
	before_action :signed_in_user
	before_action :user_activated

	def make_raport
		@ids = []

		if params[:invoice] == 'cash'
			CashExpense.where(raport: false).each { |x| @ids << x.id }
		else
			CardExpense.where(raport: false).each { |x| @ids << x.id }
		end

		@raport     = Raport.new
		@raport.ids = @ids

		if params[:invoice] == 'cash'
			path = cash_expenses_path
		else
			path = card_expenses_path
		end

		respond_to do |format|
			if @raport.save
				set_id
				format.html { redirect_to path, flash: {success: 'Raport was successfully created.'} }
			else
				format.html { redirect_to path, flash: {error: 'An error has occured, raport was not successfully created.'} }
			end
		end
	end

	def show
		@raport = Raport.find(params[:id])
		respond_to do |format|
			format.pdf do
				if params[:invoice] == 'card'
					pdf = CardPdf.new(@raport.ids, view_context)
					send_data pdf.render, filename: "#{@raport.id}.pdf",
										type:        'application/pdf',
										disposition: 'inline'
				else
					pdf = CashPdf.new(@raport.ids, view_context)
					send_data pdf.render, filename: "#{@raport.id}.pdf",
										type:        'application/pdf',
										disposition: 'inline'
				end
			end
		end
	end

	private

	def set_id
		if params[:invoice] == 'card'
			@ids.each { |x| CardExpense.find(x).update_attributes(raport_id: @raport.id, raport: true) }
		else
			@ids.each { |x| CashExpense.find(x).update_attributes(raport_id: @raport.id, raport: true) }
		end

	end

end
