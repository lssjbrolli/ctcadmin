class RaportsController < ApplicationController
	before_action :signed_in_user
	before_action :user_activated

	def make_raport
		@ids = []

		TripExpense.where(raport: false).each { |x| @ids << x.id }

		@raport     = Raport.new
		@raport.ids = @ids
		
		respond_to do |format|
			if @raport.save
				set_id
				format.html { redirect_to trip_expenses_path, flash: {success: 'Raport was successfully created.'} }
			else
				format.html { redirect_to path, flash: {error: 'An error has occured, raport was not successfully created.'} }
			end
		end
	end

	def show
		@raport = Raport.find(params[:id])
		respond_to do |format|
			format.pdf do
					pdf = TripPdf.new(@raport.ids.sort, view_context)
					send_data pdf.render, filename: "#{@raport.id}.pdf",
										type:        'application/pdf',
										disposition: 'inline'
			end
		end
	end

	private

	def set_id
		@ids.each { |x| TripExpense.find(x).update_attributes(raport_id: @raport.id, raport: true) }
	end

end
